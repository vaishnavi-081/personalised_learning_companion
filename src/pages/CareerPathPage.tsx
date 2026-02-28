import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";

import { MainLayout } from "@/components/layouts/MainLayout";

import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";

import { getCareerById, getAllSubjects } from "@/db/api";

import type { Career, Subject } from "@/types";

import { toast } from "sonner";

import {
ArrowLeft,
ArrowRight,
BookOpen,
Briefcase,
Code2,
Lightbulb,
Target,
Youtube,
} from "lucide-react";

import { LearningCard } from "@/components/learning/LearningCard";


export default function CareerPathPage(){

const {careerId}=useParams<{careerId:string}>()

const navigate=useNavigate()

const [career,setCareer]=useState<Career|null>(null)
const [subjects,setSubjects]=useState<Subject[]>([])
const [loading,setLoading]=useState(true)


useEffect(()=>{
loadData()
},[careerId])


const loadData=async()=>{

if(!careerId)return

try{

const careerData=await getCareerById(careerId)
const subjectsData=await getAllSubjects()

setCareer(careerData)
setSubjects(subjectsData)

}
catch{
toast.error("Failed to load career")
}
finally{
setLoading(false)
}

}


if(loading){
return(
<MainLayout>
<div className="flex justify-center items-center min-h-[60vh]">
Loading...
</div>
</MainLayout>
)
}


if(!career){
return(
<MainLayout>
Career Not Found
</MainLayout>
)
}



////////////////////////////
// SUBJECTS
////////////////////////////

const recommendedSubjects=career.technologies
.map((tech)=>
subjects.find(
(s)=>s.name.toLowerCase()===tech.toLowerCase()
)
)
.filter((s):s is Subject=>s!==undefined)



////////////////////////////
// VIDEOS (YOUR LINKS)
// UNCHANGED
////////////////////////////

const videos: Record<string,string> = {

"software engineer":"https://www.youtube.com/embed/-E79sLUxN3E",
"frontend developer":"https://www.youtube.com/embed/-E79sLUxN3E",
"backend developer":"https://www.youtube.com/embed/Ov3PvyyKQYA",
"full stack developer":"https://www.youtube.com/embed/hTU6HE64Wd0",
"data scientist":"https://www.youtube.com/embed/NderkpSABzw",
"ai engineer":"https://www.youtube.com/embed/uGuWKmu7YwQ",
"cybersecurity engineer":"https://www.youtube.com/embed/-4P3MTbaBUM",

"mechanical engineer":"https://www.youtube.com/embed/7-ayLOgrrcU",
"civil engineer":"https://www.youtube.com/embed/EGmZqlqQKt8",
"electrical engineer":"https://www.youtube.com/embed/v8XN-SN7gYg",
"electronics engineer":"https://www.youtube.com/embed/ZiAhlFwnNVU",

"doctor":"https://www.youtube.com/embed/AEC0rOQu-O4",
"nurse":"https://www.youtube.com/embed/jyhdK82fg0E",
"pharmacist":"https://www.youtube.com/embed/tViA-O5U6jE",
"lab technician":"https://www.youtube.com/embed/-E79sLUxN3E",
"biotechnologist":"https://www.youtube.com/embed/Ov3PvyyKQYA",

"accountant":"https://www.youtube.com/embed/NderkpSABzw",
"business analyst":"https://www.youtube.com/embed/7-ayLOgrrcU",
"bank officer":"https://www.youtube.com/embed/uGuWKmu7YwQ",
"financial analyst":"https://www.youtube.com/embed/-4P3MTbaBUM",

"teacher":"https://www.youtube.com/embed/EGmZqlqQKt8",
"designer":"https://www.youtube.com/embed/AEC0rOQu-O4",
"journalist":"https://www.youtube.com/embed/v8XN-SN7gYg",
"psychologist":"https://www.youtube.com/embed/zYthHxlerrM",

"manager":"https://www.youtube.com/embed/W_oErtmbSDU",
"hr manager":"https://www.youtube.com/embed/h1xtwROBU5E",
"marketing manager":"https://www.youtube.com/embed/NEe-fmhXbvI",

"ias officer":"https://www.youtube.com/embed/P8S0jaoaXzs",
"police officer":"https://www.youtube.com/embed/mY63OeU9QGs",
"railway officer":"https://www.youtube.com/embed/rdDa-NM69QM",
"bank po":"https://www.youtube.com/embed/35ELVDyZ_lE",
"ssc officer":"https://www.youtube.com/embed/Hl0dj3QPhbY",

"international student":"https://www.youtube.com/embed/vfwZZDcmeQo",

"startup founder":"https://www.youtube.com/embed/y6u9_9Ip6cY",
"business owner":"https://www.youtube.com/embed/y6u9_9Ip6cY",

}


const videoUrl=
videos[career.name.toLowerCase()]
||
"https://www.youtube.com/embed/-E79sLUxN3E"



return(

<MainLayout>

<div className="space-y-8 max-w-6xl mx-auto">


{/* HEADER */}

<div className="flex gap-4 items-center">

<Button
variant="ghost"
onClick={()=>navigate(-1)}
>

<ArrowLeft/>

</Button>

<div>

<h1 className="text-4xl font-bold">
{career.name}
</h1>

<p className="text-muted-foreground">
{career.description}
</p>

</div>

</div>



{/* ABOUT */}

<LearningCard
title="About Career"
icon={Briefcase}
color="blue"
>

{career.about}

</LearningCard>



{/* SKILLS */}

<LearningCard
title="Skills Required"
icon={Lightbulb}
color="purple"
>

<div className="flex flex-wrap gap-2">

{career.skills_required.map((skill,i)=>(
<Badge key={i}>{skill}</Badge>
))}

</div>

</LearningCard>



{/* TECHNOLOGIES */}

<LearningCard
title="Technologies to Learn"
icon={Code2}
color="green"
>

<div className="flex flex-wrap gap-2">

{career.technologies.map((tech,i)=>(
<Badge key={i}>{tech}</Badge>
))}

</div>

</LearningCard>



{/* ROADMAP */}

<LearningCard
title="Career Roadmap"
icon={Target}
color="orange"
>

<div className="space-y-3">

{career.roadmap.stages.map((stage,i)=>(
<div key={i}>
<b>Stage {i+1}</b>
<p>{stage}</p>
</div>
))}

</div>

</LearningCard>



{/* VIDEO */}

<LearningCard
title="Career Guidance Video"
icon={Youtube}
color="gradient"
>

<div
className="relative w-full"
style={{paddingBottom:"56.25%"}}
>

<iframe
className="absolute w-full h-full rounded-xl"
src={videoUrl}
allowFullScreen
title="Career Video"
/>

</div>

</LearningCard>



<Separator/>


<Card>

<CardContent className="text-center pt-6">

<Button
size="lg"
onClick={()=>navigate(`/careers/${careerId}/subjects`)}
>

View Required Subjects

<ArrowRight className="ml-2"/>

</Button>

</CardContent>

</Card>


</div>

</MainLayout>

)

}