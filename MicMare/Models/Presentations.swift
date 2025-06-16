//
//  Presentations.swift
//  PresentationTest
//
//  Created by Joseph Brinker on 5/12/25.
//

import Foundation
import SwiftUI

// Practice slide template
let practiceSlide = Slide(title: "Practice", content: "Read aloud like you are actually presenting to a crowd\nMake sure to stop the recording before finishing!")

// PRESENTATION 1: Bananas Are Berries?!
let p1s1 = Slide(title: "Bananas Are Berries?", content: "Yes! Botanically, they are berries.\nThey develop from a single flower with one ovary.")
let p1s2 = Slide(title: "What About Strawberries?", content: "Nope. Strawberries aren't real berries.\nThey're actually 'aggregate accessory fruits' with seeds on the outside.")
let p1s3 = Slide(title: "Science Is Weird", content: "Berries must come from one ovary and have seeds inside.\nWatermelons and pumpkins are berries too!")
let p1s4 = Slide(title: "Banana Science Flex", content: "Bananas check all the boxes. Surprise!\nWild bananas have seeds, while cultivated ones are sterile.")

let p1 = Presentation(slides: [practiceSlide, p1s1, p1s2, p1s3, p1s4])

// PRESENTATION 2: Octopus Escapes
let p2s1 = Slide(title: "Ocean Ninja: Octopus", content: "They can escape jars and mazes!\nTheir problem-solving skills rival those of some mammals.")
let p2s2 = Slide(title: "No Bones?", content: "They squeeze through tiny holes. Like, really tiny.\nAn adult octopus can fit through any hole larger than its beak.")
let p2s3 = Slide(title: "8 Brains?", content: "Kinda. They have neurons in their arms!\nEach arm can solve problems independently of the central brain.")
let p2s4 = Slide(title: "Master of Disguise", content: "Can change skin color and texture instantly.\nThey use specialized cells called chromatophores to create these incredible displays.")

let p2 = Presentation(slides: [practiceSlide, p2s1, p2s2, p2s3, p2s4])

// PRESENTATION 3: The Moon Smells Like... Gunpowder?
let p3s1 = Slide(title: "Wait, The Moon Smells?", content: "Astronauts say lunar dust smells like burnt gunpowder.\nThis was first reported by Apollo astronauts after removing their helmets.")
let p3s2 = Slide(title: "Why?", content: "Unknown! Moon dust is weirdly reactive.\nThe harsh solar radiation may create highly reactive particles.")
let p3s3 = Slide(title: "Moon Dust Party", content: "Fine, clingy, and smells intense.\nIt damaged equipment and caused 'moon hay fever' in astronauts.")
let p3s4 = Slide(title: "NASA Fact", content: "Moon boots came back smelly. For real.\nThe dust is so abrasive it wore through several layers of the astronauts' boots.")

let p3 = Presentation(slides: [practiceSlide, p3s1, p3s2, p3s3, p3s4])

// PRESENTATION 4: Sharks Lived Before Trees
let p4s1 = Slide(title: "Sharks Are Older Than Trees", content: "They've been around for 400 million years.\nThe earliest trees didn't appear until about 350 million years ago.")
let p4s2 = Slide(title: "OG Predators", content: "Before dinosaurs. Before forests!\nEarly sharks swam in oceans dominated by trilobites and sea scorpions.")
let p4s3 = Slide(title: "Shark Evolution = Long Game", content: "Survivors of 5 mass extinctions.\nTheir basic design has remained largely unchanged for millions of years.")
let p4s4 = Slide(title: "Respect the Fin", content: "They're ancient for a reason.\nOver 500 species exist today, perfectly adapted to their environments.")

let p4 = Presentation(slides: [practiceSlide, p4s1, p4s2, p4s3, p4s4])

// PRESENTATION 5: Tardigrades: Space Survivors
let p5s1 = Slide(title: "Meet the Tardigrade", content: "Tiny. Chubby. Practically indestructible.\nMost are smaller than 1mm but visible to the naked eye.")
let p5s2 = Slide(title: "Boil It. Freeze It. Still Alive.", content: "Survives extreme conditions.\nThey can withstand -272°C to 150°C and pressure six times greater than the deepest ocean.")
let p5s3 = Slide(title: "They Went to Space!", content: "And came back alive. Whoa.\nThey survived direct exposure to the vacuum and radiation of outer space.")
let p5s4 = Slide(title: "Nicknamed Water Bears", content: "Cute... and terrifyingly tough.\nThey can enter a state called cryptobiosis where they expel water and reduce metabolism by 99.99%.")

let p5 = Presentation(slides: [practiceSlide, p5s1, p5s2, p5s3, p5s4])

// PRESENTATION 6: There's a Planet Made of Diamonds
let p6s1 = Slide(title: "Diamonds... in SPACE?", content: "Yep. It's called 55 Cancri e.\nIt orbits a star 41 light-years from Earth in the Cancer constellation.")
let p6s2 = Slide(title: "Twinkle Twinkle", content: "It's 2x Earth's size and super shiny.\nScientists believe one-third of its mass is pure carbon in diamond form.")
let p6s3 = Slide(title: "Bling Worth Billions", content: "Richest planet in the galaxy?\nEstimated value: $26.9 nonillion ($26.9 followed by 30 zeros).")
let p6s4 = Slide(title: "Too Hot to Handle", content: "2,000°F surface. So… not wearable.\nIt completes an orbit around its star in just 18 hours.")

let p6 = Presentation(slides: [practiceSlide, p6s1, p6s2, p6s3, p6s4])

// PRESENTATION 7: Sloths Poop Once a Week
let p7s1 = Slide(title: "Sloths = Chill", content: "So chill, they poop weekly.\nThey can lose up to one-third of their body weight in a single bathroom trip.")
let p7s2 = Slide(title: "Risky Business", content: "Climb down trees = danger zone.\nAbout 50% of sloth deaths happen during this vulnerable descent.")
let p7s3 = Slide(title: "Why Even Do It?", content: "Scientists are still figuring it out.\nSome think it's to fertilize their favorite trees or to communicate with other sloths.")
let p7s4 = Slide(title: "Respect the Schedule", content: "One of nature's weirdest habits.\nTheir slow metabolism means food can take a month to digest fully.")

let p7 = Presentation(slides: [practiceSlide, p7s1, p7s2, p7s3, p7s4])

// PRESENTATION 8: There's a Color You Can't See
let p8s1 = Slide(title: "Impossible Colors?", content: "Your eyes can't process them.\nThey exist mathematically but are physically impossible for humans to perceive.")
let p8s2 = Slide(title: "Red-Green & Blue-Yellow", content: "Your brain blocks these combos.\nThey're called 'forbidden colors' because cone cells in your eyes can't activate this way.")
let p8s3 = Slide(title: "Optical Limits", content: "Science can simulate them… kinda.\nResearchers use eye fatigue tricks to create approximations of these colors.")
let p8s4 = Slide(title: "Mind-Bending Stuff", content: "We literally can't imagine them.\nSome animals with different photoreceptors, like mantis shrimp, might see these colors naturally.")

let p8 = Presentation(slides: [practiceSlide, p8s1, p8s2, p8s3, p8s4])

// PRESENTATION 9: Plants Can Hear
let p9s1 = Slide(title: "Say What?!", content: "Plants react to sound!\nExperiments show certain frequencies can stimulate growth and seed germination.")
let p9s2 = Slide(title: "Hungry Plants", content: "They grow faster near water sounds.\nPlants can detect vibrations as low as 20 hertz.")
let p9s3 = Slide(title: "Flower Power Ears", content: "Vibrations = growth signals.\nPlants exposed to sounds often exhibit changes in gene expression and metabolism.")
let p9s4 = Slide(title: "Silent, But Listening", content: "Next time, talk to your plants.\nSome research shows specific classical music pieces boost plant growth by up to 20%.")

let p9 = Presentation(slides: [practiceSlide, p9s1, p9s2, p9s3, p9s4])

// PRESENTATION 10: The Eiffel Tower Grows in Summer
let p10s1 = Slide(title: "Eiffel Tower Gets Taller?", content: "It expands in the heat.\nThe tower was designed with this expansion in mind.")
let p10s2 = Slide(title: "Thermal Expansion", content: "Metal swells. Eiffel gains ~6 inches!\nThe iron framework contains over 18,000 pieces joined by 2.5 million rivets.")
let p10s3 = Slide(title: "Seasonal Growth Spurt", content: "It's a summer-only thing.\nThe tower also leans slightly away from the sun due to uneven heating.")
let p10s4 = Slide(title: "Built Different", content: "Even landmarks stretch and grow.\nGustave Eiffel ingeniously designed it to withstand both expansion and wind forces.")

let p10 = Presentation(slides: [practiceSlide, p10s1, p10s2, p10s3, p10s4])

// PRESENTATION 11: Spaghettification: What Black Holes Do to You
let p11s1 = Slide(title: "Spaghettification!", content: "What happens if you fall into a black hole.\nThe term was coined by physicist Stephen Hawking in his book 'A Brief History of Time'.")
let p11s2 = Slide(title: "You Get Stretched", content: "Tidal forces pull harder on your feet than your head.\nThe gravity gradient becomes so extreme that your body would stretch vertically and compress horizontally.")
let p11s3 = Slide(title: "Like a Noodle", content: "You'd be stretched into a thin spaghetti strand.\nNear smaller black holes, you'd be spaghettified before crossing the event horizon.")
let p11s4 = Slide(title: "Painful? Yes.", content: "You won't survive... but it's fascinating.\nThe stretching forces would tear apart your atomic bonds.")
let p11s5 = Slide(title: "Time Stops", content: "From the outside, you'd seem frozen at the event horizon.\nDue to time dilation, your descent would appear to slow and eventually stop completely.")

let p11 = Presentation(slides: [practiceSlide, p11s1, p11s2, p11s3, p11s4, p11s5])

// PRESENTATION 12: Butterflies Taste With Their Feet
let p12s1 = Slide(title: "Feet = Taste Buds?", content: "Butterflies taste through their feet!\nThese taste receptors are called chemoreceptors and they're located in their tarsi (feet).")
let p12s2 = Slide(title: "How It Works", content: "Sensors on their feet detect sugars.\nThey can detect concentrations as low as 0.03% sugar solution.")
let p12s3 = Slide(title: "Land & Taste", content: "When they land on flowers, they 'lick' with their toes.\nThis helps them immediately identify whether a plant is suitable for laying eggs.")
let p12s4 = Slide(title: "Evolution Win", content: "Helps them know where to lay eggs.\nFemale butterflies ensure caterpillars have the right food upon hatching.")
let p12s5 = Slide(title: "Winged Weirdos", content: "Another reason nature is wild.\nSome butterfly species can taste with their antennae and proboscis too.")

let p12 = Presentation(slides: [practiceSlide, p12s1, p12s2, p12s3, p12s4, p12s5])

// PRESENTATION 13: Lightning Is Hotter Than the Sun
let p13s1 = Slide(title: "Lightning = Fire", content: "A bolt can reach 30,000°C!\nThis is five times hotter than the surface of the sun.")
let p13s2 = Slide(title: "Hotter Than the Sun", content: "The surface of the sun is only ~5,500°C.\nThough the sun's core reaches about 15 million°C.")
let p13s3 = Slide(title: "Super Fast", content: "Strikes last 0.03 seconds but pack a punch.\nLightning travels at about 270,000 mph (440,000 km/h).")
let p13s4 = Slide(title: "100 Million Volts", content: "That's a lot of energy in a flash.\nA single bolt contains enough energy to power a house for a month.")
let p13s5 = Slide(title: "Trees Explode", content: "Lightning can make trees burst from steam!\nThe sap inside the tree instantly vaporizes, causing an explosive expansion.")
let p13s6 = Slide(title: "Zap!", content: "Nature's most electrifying show.\nEarth experiences about 44 lightning strikes every second, or 1.4 billion a year.")

let p13 = Presentation(slides: [practiceSlide, p13s1, p13s2, p13s3, p13s4, p13s5, p13s6])

// PRESENTATION 14: Is Glass a Liquid?
let p14s1 = Slide(title: "Is Glass a Liquid?", content: "Kinda. Kinda not.\nGlass exists in a state called 'amorphous solid' or 'supercooled liquid'.")
let p14s2 = Slide(title: "Amorphous Solid", content: "It behaves like a slow-moving liquid.\nBut on timescales so vast that meaningful flow would take millions of years.")
let p14s3 = Slide(title: "Old Windows Are Thicker at Bottom", content: "People once thought it was proof.\nThis myth persisted in scientific textbooks for decades.")
let p14s4 = Slide(title: "But Actually...", content: "It's how old glass was made, not flow.\nMedieval glass-making techniques created uneven thickness during manufacturing.")
let p14s5 = Slide(title: "Weird Material Science", content: "Glass is its own thing.\nScientists now classify it as a 'non-crystalline solid' with its own phase of matter.")

let p14 = Presentation(slides: [practiceSlide, p14s1, p14s2, p14s3, p14s4, p14s5])

// PRESENTATION 15: Space Isn't Totally Silent
let p15s1 = Slide(title: "Space Sounds?", content: "We always hear it's silent... but...\nSound as we know it can't travel through the vacuum of space.")
let p15s2 = Slide(title: "Not Totally True", content: "In space, sound waves can't travel in a vacuum.\nWithout air molecules to vibrate, traditional sound transmission is impossible.")
let p15s3 = Slide(title: "But There Are Vibrations", content: "NASA converts space signals to sound.\nThey translate electromagnetic waves, like radio waves, into audible frequencies.")
let p15s4 = Slide(title: "Black Hole Audio", content: "You can 'hear' a black hole's hum.\nNASA recorded the 'sound' of a supermassive black hole 250 million light-years away.")
let p15s5 = Slide(title: "Space Symphony", content: "The universe has its own music.\nPlasma waves within celestial bodies create vibrations similar to sound waves.")
let p15s6 = Slide(title: "Spooky & Cool", content: "Search NASA sounds if you dare.\nJupiter's magnetic field produces particularly eerie 'screaming' sounds when converted.")

let p15 = Presentation(slides: [practiceSlide, p15s1, p15s2, p15s3, p15s4, p15s5, p15s6])

// PRESENTATION 16: Wombats Poop Cubes
let p16s1 = Slide(title: "Wombat Poop = Cubes", content: "Yes, cube-shaped poop. No joke.\nThey're the only known animals that produce cubic feces.")
let p16s2 = Slide(title: "Why Cubes?", content: "Their intestines squeeze it that way.\nThe last 8% of their intestines have varying elastic properties that shape the poop.")
let p16s3 = Slide(title: "Useful Skill", content: "They use poop to mark territory.\nAn adult wombat can produce 80-100 cube-shaped droppings per night.")
let p16s4 = Slide(title: "Won't Roll Away", content: "Cubes stay in place. Genius.\nThis shape prevents them from rolling off rocks or high places where they're strategically placed.")
let p16s5 = Slide(title: "Science Won an Ig Nobel", content: "Yes. It's a thing.\nResearchers won the 2019 Ig Nobel Prize in Physics for studying how and why wombats make cube-shaped poop.")

let p16 = Presentation(slides: [practiceSlide, p16s1, p16s2, p16s3, p16s4, p16s5])

// PRESENTATION 17: The Smell of Rain Has a Name
let p17s1 = Slide(title: "Smell of Rain?", content: "That fresh smell after rain has a name.\nThe human nose is extremely sensitive to this particular scent.")
let p17s2 = Slide(title: "It's Called Petrichor", content: "Coined in the 1960s.\nFrom the Greek 'petra' (stone) and 'ichor' (the fluid that flows in the veins of the gods).")
let p17s3 = Slide(title: "Made by Bacteria", content: "Actinobacteria release geosmin.\nThese same compounds give beets their earthy flavor.")
let p17s4 = Slide(title: "Rain Releases It", content: "Water droplets launch scent into air.\nThe process of aerosol release during rainfall is called the 'Raindrop Effect'.")
let p17s5 = Slide(title: "Brain Loves It", content: "We associate it with clean, fresh feelings.\nThe human nose can detect geosmin at concentrations as low as 5 parts per trillion.")
let p17s6 = Slide(title: "Shared Experience", content: "Humans all over love that smell.\nPerfumers and aromatherapists often try to replicate this universally appealing scent.")

let p17 = Presentation(slides: [practiceSlide, p17s1, p17s2, p17s3, p17s4, p17s5, p17s6])

// PRESENTATION 18: There's a Volcano Under Yellowstone
let p18s1 = Slide(title: "Yellowstone = Supervolcano", content: "There's a giant volcano beneath it.\nIt's one of the largest volcanic systems in the world, covering an area of approximately 30 by 45 miles.")
let p18s2 = Slide(title: "Potentially Explosive", content: "Eruptions could affect the globe.\nThe last major eruption occurred 640,000 years ago, ejecting 240 cubic miles of material.")
let p18s3 = Slide(title: "44-Mile Magma Chamber", content: "Massive underground fuel tank.\nContains enough magma to fill the Grand Canyon more than 11 times.")
let p18s4 = Slide(title: "Scientists Monitor It", content: "Lots of sensors, just in case.\nOver 40 seismometers constantly monitor earthquake activity in the area.")
let p18s5 = Slide(title: "Don't Panic Yet", content: "No eruption is expected soon.\nThe USGS estimates a 0.00014% chance of eruption in any given year.")
let p18s6 = Slide(title: "But It's a Netflix Doc", content: "Because, of course.\nThe caldera's spectacular geysers and hot springs are actually signs of the massive heat beneath.")

let p18 = Presentation(slides: [practiceSlide, p18s1, p18s2, p18s3, p18s4, p18s5, p18s6])

// PRESENTATION 19: Some Jellyfish Are Technically Immortal
let p19s1 = Slide(title: "Jellyfish = Immortal?", content: "Some can revert to earlier stages of life.\nThey can transform from mature medusa back to the polyp stage indefinitely.")
let p19s2 = Slide(title: "Turritopsis dohrnii", content: "Known as the 'immortal jellyfish'.\nFirst discovered in the Mediterranean Sea in 1883 but immortality wasn't discovered until the 1990s.")
let p19s3 = Slide(title: "Reverse Aging", content: "They can restart their life cycle.\nThis process is called 'transdifferentiation' where cells transform from one type to another.")
let p19s4 = Slide(title: "No Death From Old Age", content: "They only die from disease or predators.\nThey can potentially repeat their life cycle hundreds of times.")
let p19s5 = Slide(title: "Aging Hack?", content: "Scientists are studying them for clues.\nTheir cells appear to have unique telomerase activity that prevents typical cellular aging.")

let p19 = Presentation(slides: [practiceSlide, p19s1, p19s2, p19s3, p19s4, p19s5])

// PRESENTATION 20: You Glow in the Dark (A Little Bit)
let p20s1 = Slide(title: "Humans Glow?", content: "Yes, but it's super faint.\nThis phenomenon is called 'biophoton emission' or 'human bioluminescence'.")
let p20s2 = Slide(title: "Bioluminescence?", content: "Not exactly. More like ultraweak photon emission.\nAbout 1,000 photons per square centimeter of skin per second.")
let p20s3 = Slide(title: "Special Cameras Needed", content: "Normal eyes can't see it.\nScientists use photomultiplier tubes that can detect single photons.")
let p20s4 = Slide(title: "Peaks at 4 PM", content: "Your glow has a daily cycle.\nThe face glows the most, possibly due to higher sun exposure and metabolic activity.")
let p20s5 = Slide(title: "Invisible Shine", content: "You're glowing and didn't even know.\nThis glow might be linked to metabolic fluctuations and cellular energy production.")

let p20 = Presentation(slides: [practiceSlide, p20s1, p20s2, p20s3, p20s4, p20s5])

// List of all presentations
var presentations = Presentations(presentations: [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20])
