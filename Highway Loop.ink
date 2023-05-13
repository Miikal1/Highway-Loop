VAR hour = 10
VAR min = 30
VAR speed = "at normal speed"
VAR location = "tunnel exit"
VAR transport = "driving"
VAR carLocation = "tunnel exit"
VAR radio = false
VAR glove = false
VAR manual = false
VAR papers = false
VAR trunk = false
VAR bungie = false
VAR tarp = false


-> opening

=== opening ===
Time: 10:00 PM Thrusday

Its been a long day at work. You stayed at the office late, working hard to meet the quota. Your really tired as you check out of the building and head to you car.

You begin driving back to your apartment, eventually getting on the highway. After some driving, you come across a construction crew, whose work has closed your usual route home. You have to take a detour, so you turn and drive to a different road, which leads to another highway, one you never been down before. It eventually leads to a tunnel in the side of a mountain.
    * Drive through the tunnel
-> TunnelExit

=== TunnelExit
>Time 10:30

You reach the end of the tunnel and driven onto the highway. It takes the form of a long bridge, stretching between two mountains. You can see another tunnel at the end of the highway and below it appears to be a desert. You see no other cars.
    * Continue driving
-> LeftHighway

=== LeftHighway ===
Time 10:40

You drive forward and reach an early portion of the highway. Street lamps bathe the road in light, so much to the point that you really don't need your head lights, so you decide to take them off.  One of the street lamps has a sign on it that shows the speed limit, 65 miles and hour. There are still no cars to be seen.
    * Continue driving
-> MidHighway
    
=== MidHighway ===
Time: 10:50

You reach the dead middle of the highway. The lack of bumps and noise tells you that the road is incredibly smooth, and you enjoy the feeling of easy travel it provides. This feeling is made better by the complete lack of cars to get in the. You would think with that other highway closed, more people would be using this road.
    * Continue driving
-> RightHighway

=== RightHighway ===
Time: 11:00

You reach the later section of the highway. Your remark at the lack of cars, or thing that would have another human, gives you a feeling of freedom, leading you to pick up speed. You relish the feeling of going fast, something you thought you could never get away with. You look forward to some extra time to sleep when you get home
    * Continue driving
-> TunnelEntrance

=== TunnelEntrance ===
Time 11:05

You reach the entrance of the tunnel at the highway. As you go through, you wonder how you never went down this stretch of road before and wonder if you ever will again once your usual road reopens. You then slow down to the speed limit as you go pass through the tunnel entrance, already remembering where to turn to back on the route home.
    * Drive through the tunnel
-> Realization

=== Realization ===
Time: 10:30

You reach the end of the tunnel and drive onto a highway, which takes the form of a long bridge, stretching between two mountains. 

Wait . . . This looks just like the highway you just left. Your a tad confused, and in your confusion, you take a quick look at the clock on the dash. Its the same time as when you first entered the highway. Now even more confused, you speed through the highway, charging through the tunnel at the end, only end up back at the first tunnel at the beginning of the highway. You charge through again, many times, desparatly trying to escape, but you always end back where you start, and you always leave the tunnel at the same time to. Realizing that brute force won't work, you slow down while in the tunnel and as you move forward, you start thinking of what you can do in this situation.
    * Lets see, is there anything you can do that effects anything
-> Loop

=== Loop ===
Time = {hour}:{min}

{transport == "driving": 
You are driving along the highway, going {speed} and have reached the {location}.

Your cell phone lays in the cup holder. 

{glove == true:
The glove compartment is open.
}

{radio == true:
The radio is turned on, playing music.
}

+ {transport == "driving"} Continue driving
    -> forward

+ {speed != "at normal speed"} Go at normal speed
    You bring the car to normal speed as your drive forward.
    ~ speed = "at normal speed"
    -> forward
    
+ {speed != "fast"} Go fast
    As you drive down the highway, you pick up speed till your going fast.
    ~ speed = "fast"
    -> forward
    
+ {speed != "slowly"} Go slowly
    You start slowing down the car as your drive forward.
    ~ speed = "slowly"
    -> forward

+ Use the phone to call for help
    You stop you car and dial a number on your phone, maybe friend or emergncy services. They never pick up and all you hear is the dial tone
    -> Loop   


+ {radio == false} Turn on the radio
    You turn the car's radio on. Some old and new songs play from the speakers.
    ~ radio = true
    -> Loop


+ {radio == true} Turn off the radio
    You turn the car's radio off. The car's speakers go silent.
    ~ radio = false
    -> Loop


+ {glove == false} Open the glove compartment
    {manual == false && papers == false:
    You open the glove compartment and find a thick vehicle manual and insurance papers.
    }
    {manual == true && papers == false:
    You open the glove compartment and find some insurance papers.
    }
    ~ glove = true
    -> Loop
    {manual == false && papers == true:
    You open the glove compartment and find a thick vehicle manual.
    }
    {manual == true && papers == true:
    You open the glove compartment and find empty.
    }
    
+ {glove == true} close the glove compartment
    You close the gloe compartment and hear a click when it shutsl.
    ~ glove = true
    -> Loop
    
+ {glove == true && manual == false} Take the manual
    You take out the manual and decide to carry it with you.
    ~ manual = true
    -> Loop
    
+ {glove == true && manual == true} return the manual
    You put the manual back in the glove compartment.
    ~ manual = false
    -> Loop
    
+ {glove == true && papers == false} Take the insurance papers
    You take out the insurance papers and put them in your back pocket.
    ~ papers = true
    -> Loop
    
+ {glove == true && papers == true} return insurance papers
    You put the insurance papers back in the glove compartment.
    ~ papers = false
    -> Loop

+ Stop and get out of the car.
    You slow the car to a stop and get out, you take all the stuff in the car with you. You then start walking down the highway.
    ~ transport = "walking"
    -> Loop
    
    
}

{transport == "walking":
You are walking down the highway, and have reached the {location}.

Your cell phone is in your pocket.

+ {transport == "walking"} Walk forward
    -> forward
    
+ {transport == "walking"} Walk back the way you came
   -> forward

+ Use the phone to call for help
    You take out your phone and dial a number on your phone, maybe friend or emergncy services. They never pick up and all you hear is the dial tone
    -> Loop   

+ {carLocation == location && trunk == false} Check the trunk
    {bungie == false && tarp == false:
    You walk to the back of the car and open the trunk. You find a spare tire, a bunch of bungie cables. You struggle to think of a use for the contents.
    }
    {bungie == false:
    You walk to the back of the car and open the trunk. You find a spare tire, and a bunch of bungie cables.
    }
    ~ trunk = true
    -> Loop
    {bungie == true:
    You walk to the back of the car and open the trunk. You find a spare tire.
    }
    ~ trunk = true
    -> Loop
    
+ {carLocation == location && trunk == true} Close the trunk
    You close the door of the trunk.
    ~ trunk = false
    -> Loop
    
+ {trunk == true && bungie == false} Take the bungie cords
    You take out the bungie cords and decide to carry them with you.
    ~ bungie = true
    -> Loop
    
+ {trunk == true && bungie == true} return the bungie cords
    You put the bungie cords back in the trunk.
    ~ bungie = false
    -> Loop
    
+ {carLocation == location && manual == false} Look under the hooded
    You pop open the car's hood and take a look. It smells horrible, but you really can't tell what your looking at or what you can do. You close the hood down without doing anyhting.
    -> Loop
    
+ {carLocation == location && manual == true} Look under the hooded
    You pop open the car's hood and take a look. It smells horrible, but with some diagrams from the manual, you identify a few parts you can rearrange. You do just that, and come out with greasy hands. You close the hood down and wipe your hands on you pants.
    -> Loop
    
+ {bungie == true} Make a rope from the bungie
-> Deciesion
    
+ {carLocation == location} Go back to the car
    You walk back to the car, get inside, and turn on the engine.
    ~ transport = "driving"
    -> Loop
}    
    
=== forward ===
    {location == "tunnel exit":
        ~ location = "left side of the highway"
        ~ carLocation = "left side of the highway"
        {speed == "at normal speed":
            ~ min = min + 10
        }
        {speed == "fast":
            ~ min = min + 5
        }
        {speed == "slowly":
            ~ min = min + 20
        }
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "left side of the highway":
        ~ location = "middle of the highway"
        ~ carLocation = "middle of the highway"
        {speed == "at normal speed":
            ~ min = min + 10
        }
        {speed == "fast":
            ~ min = min + 5
        }
        {speed == "slowly":
            ~ min = min + 20
        }
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "middle of the highway":
        ~ location = "right side of the highway"
        ~ carLocation = "right side of the highway"
        {speed == "at normal speed":
            ~ min = min + 10
        }
        {speed == "fast":
            ~ min = min + 5
        }
        {speed == "slowly":
            ~ min = min + 20
        }
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "right side of the highway":
        ~ location = "tunnel entrance"
        ~ carLocation = "tunnel entrance"
        {speed == "at normal speed":
            ~ min = min + 10
        }
        {speed == "fast":
            ~ min = min + 5
        }
        {speed == "slowly":
            ~ min = min + 20
        }
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "tunnel entrance":
        ~ location = "tunnel exit"
        ~ carLocation = "tunnel exit"
        ~ hour = 10
        ~ min = 30
        ~ radio = false
        ~ glove = false
        ~ manual = false
        ~ trunk = false
        -> Loop
    }
    
    {location == "tunnel exit":
        ~ location = "left side of the highway"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "left side of the highway":
        ~ location = "middle of the highway"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "middle of the highway":
        ~ location = "right side of the highway"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "right side of the highway":
        ~ location = "tunnel entrance"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "tunnel entrance":
        ~ location = "tunnel exit"
        ~ hour = 10
        ~ min = 30
        ~ radio = false
        ~ glove = false
        ~ manual = false
        ~ trunk = false
        -> Loop
    }
    
    {location == "tunnel entrance":
        ~ location = "right side of the highway"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "right side of the highway":
        ~ location = "middle of the highway"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "middle of the highway":
        ~ location = "left side of the highway"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "left side of the highway":
        ~ location = "tunnel exit"
        ~ min = min + 15
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
        -> Loop
    }
    {location == "tunnel exit":
        You walk back through the exit, but you just end up walking back to the highway, though you sure you walked straight. Checking you phone, it seems that no time has passed.
        -> Loop
    }
    
=== Deciesion ===
Time = {hour}:{min}
You link the bungie cords at the ends with their hooks, making one long, stretchy rope. You hang this make shift rope from one of the street lamps, and it appears to reach just a yard above the ground below. You could climb down.
Climbing down would be incredibly dangerous. One mistake could lead to acceidently letting go or hooks coming undone, which you send you plummiting to your doom. And then theres the fact that this will be a very tiring experience.
Are you still going to go for it
+ Yes
    ~ min = min + 10
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
    -> Rope
+ no
    You decide that this is a crazy idea, so you abandon the idea, take the bungie cords back, and try to think of another way.
    -> Loop

=== Rope ===
Time = {hour}:{min}
You take a deep breath, grip the bungie cord rope tight, and suspend yourself over the edge of the highway. The strength needed to hold on put enormous strain on your arms. Gritting your teeth as you struggle against the pain, you begin to climb down you makeshift rope, one hand at a time. You take extra care to not cut your self on the bungie cord's hooks, and even more care to not let any hooks unlink.
You eventually make it to the last bungie cord, which suspends you a yard above the ground. To reach the ground yow will have to let go. Do you dare?
+ Yes
~ min = min + 1
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
         {hour >= 13:
            ~ hour = hour - 12
        }
    -> Ground
+ no
    You decide that the fall is not worth it and you chose to climb back up to the highway. Surpisingly, it seems to take less effort to climb up than down. Once your back to the highway, you begin to think of another solution.
    -> Loop
    
=== Ground ===
Time = {hour}:{min}
You let go of the bungie cord rope and fall. You try to land on your feet, but stumble, and with your arms exhausted from the climb, you can't stop yourself from faceplanting into the dirt.
After a painful struggle to stand up, you look around at your surroundings. To the left and right of the highway, the dirt landscape seems to go on forever, while you see mountains of both ends of the highway.
You begin to think. Since the loop resets when you go through the tunnel, perhaps the solution is to not use the tunnel. Now that your on the ground, you can walk to the mountain and climb over it, avoiding the tunnel and maybe esacping this place.
If you go through with this plan, its going to be a really long walk to the mountain's base. Will you go?
+ Yes
~ min = min + 30
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
        {hour >= 13:
            ~ hour = hour - 12
        }    
    -> Bottom
+ no
    You decide that the journey would be way to tiring, you decide to return to the highway. You manage to jump back up to the rope of bungie cords and climb back up. Somehow, this isn't all that tiring. Once back up on th highway, you gather the bungie cords and begin to think of an different answer.
    -> Loop
    
=== Bottom ===
Time = {hour}:{min}
You walk across the desert, toward the mountain with the tunnel entrance. The walk takes a long time and tires you out. Your arms don't seem to recover while you walk, and when you finally get to the mountain base, your legs are in incredible pain.
Now you have to get over the mountain. Are you going to keep going?
+ Yes
~ min = min + 40
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
        {hour >= 13:
            ~ hour = hour - 12
        }    
    -> Peak
+ no
    You decide that the climb would be way to tiring and dangerous, you decide to return to the highway. You walk back to where you started and manage to jump back up to the rope of bungie cords and climb back up. Somehow, this journey isn't all that tiring. Once back up on th highway, you gather the bungie cords and begin to think of an different answer.
    -> Loop
    
=== Peak ===
Time = {hour}:{min}
With weakened arms and legs, you brave the mountain and start climbing. There's no hiking trail, so you have to go where you believe going up the mountain is possible. Its incredibly hard to walk up the steep slopes of the mountain, and in some places you have to actually climb up rock faces, struggling and suffering to pull your self up.
After so much pain, you finally make it past the peak of the mountain. In the distance, you can see roads with street lights and even some buildings.
Your nearly there, you just need to get down the other side of the mountain, which is made up of very steep slopes. You gonna go for it?
+ Yes
    ~ min = min + 40
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
        {hour >= 13:
            ~ hour = hour - 12
        }
    -> Slope
+ no
    You decide that the would be way to tiring and dangerous, you decide to return to the highway. You climb back down the mountain and walk back to where you started, where you manage to jump back up to the rope of bungie cords and climb back up. Somehow, this hourney isn't all that tiring. Once back up on th highway, you gather the bungie cords and begin to think of an different answer.
    -> Loop
    
=== Slope ===
Time = {hour}:{min}
You begin your long climb down the mountain, struggling to hang on to rock face as you scale the way down, tiring yourself out even more. You don't come across any flat ground until your close to the bottom. After you finally reach the bottom, you struggle to catch your breath as you head toward the road and the nearest building. You make it to a gas station, but its closed.
+ You made out of the highway. Go ahead walk home.
    ~ min = min + 60
        {min >= 60:
            ~ hour = hour + 1
            ~ min = min - 60
        }
        {hour >= 13:
            ~ hour = hour - 12
        }
    -> Ending
    
=== Ending ===
Time = {hour}:{min}
You begin the long walk back to your apartment. You get even more tired as make your way along the road and into the city. You never see a car rolling through the city streets, but even if you did your too weak to ask for a ride. Eventually, you finally make it to your apartment, where you head inside, weakly shut the door, flop into bed, and fall asleep instantly.
Time = 4:00 PM Friday
When you finally wake up the next day, you faintly hear a phone ringing, which can't be your smart phone as you never plugged it in. After the rest of your body wakes up, you weakly walk to your land line phone and answer. 
Its your boss, who is angry that you never showed up for work. Weakly, you tell the boss that you cna't come in today, claiming that you car was stolen last night, forcing you to walk home. The boss is surprised, then sighs and begrudgingly gives you the day off, expecting you work remotely if you can't find a bus route to the office.
{papers == false:
After you hang up, you realize that you left your insurance papers in the car, which is now lost on time loop highway. Without those papers, getting a new car is going to be difficult.
}
{papers == true:
After you hang up, you realize remember that you brought your insurance papers back with you, which will be helpful with buying a new car, since your old one is lost on a time loop highway. Smart move.
}
In the meantime, you look up a map of the county in order to check local bus routes. While looking, you can't seem to find the highway on the map. So did you get there? Why did you end up there?
You decide to stop asking questions. You want nothing to do with that highway ever again!
-> END