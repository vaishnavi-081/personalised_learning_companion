import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';

import {
getAllSubjectDomains,
getSubjectsByDomain,
getUserSubjects,
enrollInSubject
} from '@/db/api';

import type { Subject, UserSubject, SubjectDomain } from '@/types';

import { toast } from 'sonner';

import {
BookOpen,
CheckCircle2
} from 'lucide-react';

import { Skeleton } from '@/components/ui/skeleton';

import {
Tabs,
TabsContent,
TabsList,
TabsTrigger
} from '@/components/ui/tabs';



export default function SubjectsPage() {

const { profile } = useAuth();

const navigate = useNavigate();

const [domains,setDomains] = useState<SubjectDomain[]>([]);
const [subjectsByDomain,setSubjectsByDomain] =
useState<Record<string,Subject[]>>({});
const [enrolledSubjects,setEnrolledSubjects] =
useState<UserSubject[]>([]);
const [loading,setLoading] = useState(true);



useEffect(()=>{

loadData()

},[profile?.id])



/////////////////////////
// LOAD DATA
/////////////////////////

const loadData = async()=>{

if(!profile?.id)return

try{

const [domainsData,userSubjects] = await Promise.all([

getAllSubjectDomains(),

getUserSubjects(profile.id)

])

setDomains(domainsData)

setEnrolledSubjects(userSubjects)



const subjectsMap:Record<string,Subject[]>={}

for(const domain of domainsData){

const subjects = await getSubjectsByDomain(domain.id)

subjectsMap[domain.id] = subjects

}

setSubjectsByDomain(subjectsMap)

}
catch{

toast.error("Failed to load subjects")

}
finally{

setLoading(false)

}

}



/////////////////////////
// CHECK ENROLLMENT
/////////////////////////

const isEnrolled = (subjectId:string)=>{

return enrolledSubjects.some(
s=>s.subject_id===subjectId
)

}



/////////////////////////
// SELECT SUBJECT
/////////////////////////

const handleSelectSubject = async(subjectId:string)=>{

if(!profile?.id)return



// Already enrolled
if(isEnrolled(subjectId)){

navigate(`/subject/${subjectId}/topics`)

return

}



try{

await enrollInSubject(profile.id,subjectId)



// Reload enrollment for dashboard tracking
const updatedSubjects = await getUserSubjects(profile.id)

setEnrolledSubjects(updatedSubjects)



toast.success("Subject Enrolled Successfully")

navigate(`/subject/${subjectId}/knowledge-check`)

}
catch{

toast.error("Enrollment Failed")

}

}



/////////////////////////
// LOADING SCREEN
/////////////////////////

if(loading){

return(

<MainLayout>

<div className="space-y-6">

<h1 className="text-4xl font-bold">

Choose Your Subjects

</h1>

<div className="grid md:grid-cols-3 gap-6">

{[...Array(6)].map((_,i)=>(

<Card key={i}>

<CardHeader>

<Skeleton className="h-6 w-32"/>

</CardHeader>

<CardContent>

<Skeleton className="h-10 w-full"/>

</CardContent>

</Card>

))}

</div>

</div>

</MainLayout>

)

}



/////////////////////////
// PAGE UI
/////////////////////////

return(

<MainLayout>

<div className="space-y-6">

<div className="text-center">

<h1 className="text-5xl font-bold gradient-text">

Choose Your Subjects

</h1>

<p className="text-muted-foreground mt-2">

Select subjects and track progress

</p>

</div>



<Tabs defaultValue={domains[0]?.id}>



<TabsList className="grid grid-cols-3 mb-6">

{domains.map(domain=>(

<TabsTrigger key={domain.id} value={domain.id}>

{domain.icon} {domain.name}

</TabsTrigger>

))}

</TabsList>



{domains.map(domain=>(

<TabsContent key={domain.id} value={domain.id}>

<div className="grid md:grid-cols-3 gap-6">



{subjectsByDomain[domain.id]?.map(subject=>{

const enrolled = isEnrolled(subject.id)

const userSubject =
enrolledSubjects.find(
s=>s.subject_id===subject.id
)



return(

<Card
key={subject.id}
className="cursor-pointer hover:shadow-lg transition hover:-translate-y-1"
onClick={()=>handleSelectSubject(subject.id)}
>

<CardHeader>

<div className="flex justify-between">

<div className="text-3xl">

{subject.icon}

</div>

{enrolled && (

<CheckCircle2 className="text-green-500"/>

)}

</div>

<CardTitle>

{subject.name}

</CardTitle>

<CardDescription>

{subject.description}

</CardDescription>

</CardHeader>



<CardContent>

{enrolled && userSubject && (

<div className="mb-3">

<div className="flex justify-between text-sm">

<span>Progress</span>

<span>

{userSubject.progress_percentage}%

</span>

</div>

<div className="bg-muted h-2 rounded">

<div
className="bg-primary h-2 rounded"
style={{
width:
`${userSubject.progress_percentage}%`
}}
/>

</div>

</div>

)}



<Button className="w-full">

<BookOpen className="mr-2 h-4 w-4"/>

{enrolled
? "Continue Learning"
: "Start Learning"}

</Button>



</CardContent>

</Card>

)

})}



</div>

</TabsContent>

))}



</Tabs>

</div>

</MainLayout>

)

}