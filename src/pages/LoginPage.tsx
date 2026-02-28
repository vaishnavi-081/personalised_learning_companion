import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';

import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';

import {
Card,
CardContent,
CardHeader,
CardTitle,
CardDescription
} from '@/components/ui/card';

import { toast } from 'sonner';

import {
Mail,
Lock,
Sparkles,
BookOpen
} from 'lucide-react';


export default function LoginPage() {

const [username,setUsername]=useState('')
const [password,setPassword]=useState('')
const [loading,setLoading]=useState(false)

const {signInWithUsername}=useAuth()

const navigate=useNavigate()

//////////////////////////////
// ALWAYS GO DASHBOARD
//////////////////////////////

const from="/dashboard"



const handleSubmit=async(e:React.FormEvent)=>{

e.preventDefault()

if(!username||!password){

toast.error("Fill all fields")
return

}

setLoading(true)

const {error}=await signInWithUsername(
username,
password
)

setLoading(false)

if(error){

toast.error("Login Failed")

}
else{

toast.success("Login Success")

navigate(from,{replace:true})

}

}



return(

<div className="min-h-screen flex items-center justify-center relative overflow-hidden">


{/* BACKGROUND IMAGE */}

<div
className="absolute inset-0 bg-cover bg-center"
style={{
backgroundImage:
"url(https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=1920&q=80)",
filter:"blur(8px)"
}}
/>


<div className="absolute inset-0 bg-black/40"/>



<Card className="relative z-10 w-full max-w-md backdrop-blur-xl bg-white/90">

<CardHeader className="text-center space-y-4">


<div className="mx-auto w-16 h-16 rounded-xl bg-primary/20 flex items-center justify-center">

<BookOpen className="h-8 w-8 text-primary"/>

</div>



<div>

<div className="flex justify-center gap-2">

<Sparkles className="text-primary"/>

<CardTitle className="text-4xl">

Learning Companion

</CardTitle>

<Sparkles className="text-primary"/>

</div>

<CardDescription>

Start Learning Journey

</CardDescription>

</div>

</CardHeader>



<CardContent>

<form
onSubmit={handleSubmit}
className="space-y-6"
>


<div>

<Label>Username</Label>

<div className="relative">

<Mail className="absolute left-3 top-3 h-4 w-4"/>

<Input
className="pl-10"
value={username}
onChange={e=>setUsername(e.target.value)}
/>

</div>

</div>



<div>

<Label>Password</Label>

<div className="relative">

<Lock className="absolute left-3 top-3 h-4 w-4"/>

<Input
type="password"
className="pl-10"
value={password}
onChange={e=>setPassword(e.target.value)}
/>

</div>

</div>



<Button
className="w-full h-12 text-lg"
disabled={loading}
>

{loading?"Signing in...":"Sign In"}

</Button>


</form>



<div className="text-center mt-4">

<Link
to="/signup"
className="text-primary"
>

Create Account

</Link>

</div>


</CardContent>

</Card>

</div>

)

}