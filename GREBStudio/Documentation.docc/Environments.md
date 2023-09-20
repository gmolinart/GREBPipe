# Environments

**The Dawn of Data Abstraction: A Glimpse into the Past**

In the realm of computer science, the evolution of data abstraction stands as a testament to human ingenuity. The story I'm about to share offers a fascinating glimpse into the earliest known form of what we now recognize as data abstraction.

Back in 1961, in his talk [Alan Kay at OOPSLA 1997: The Computer Revolution has not Happened Yet]() the Air Force, I stumbled upon a unique approach to data management. It's worth noting that this was a time when operating systems were virtually non-existent. The Air Training Command faced the challenge of transmitting tapes containing various records from one Air Force base to another. With the advent of tapes, the previously used card images were becoming obsolete, leading to increasingly complex formats.

Enter an innovative solution, likely conceived by an enlisted man (given that officers weren't programmers back then). The idea was simple yet revolutionary:

1. The third part of the record on the tape would house records of a specific type.
2. The second part would contain procedures familiar with the formats in the third section.
3. The first part would consist of pointers directing to the procedures. The initial ten pointers would be standardized for basic operations like reading, writing, and printing, while subsequent pointers could be tailored as needed.

To access the data, one simply had to load the front part of a record into core storage and navigate through the pointers. The necessary procedures were already embedded.

Contrast this with the complexities of HTML on the Internet. The modern web, with its reliance on browsers to interpret HTML formats, feels like a step back into the dark ages. This browser-centric approach, arguably one of the most flawed ideas since MS-DOS, has led to unnecessary complications. The ongoing browser wars, driven by a mix of misunderstanding complex systems and territorial ambitions, seem entirely redundant. If we had adhered to the wisdom of that Air Force Staff Sergeant from 1961, browsers would be obsolete. Data should be accompanied by everything it requires for interpretation, without the need for external entities like browsers.

The Internet, with its ever-evolving HTML formats, is slowly realizing the pitfalls of its current approach. This cyclical error, repeated every generation, underscores the importance of learning from the past.

Interestingly, this advanced form of programming in the Air Force predated the advent of higher-level languages. However, the shift to COBOL as a standard led to the phasing out of this approach.

Another remarkable innovation from that era was Ivan Sutherland's Sketchpad. A marvel in its own right, Sketchpad was a precursor to object-oriented systems. It introduced concepts like classes, subclasses, and polymorphism, with capabilities even surpassing the Air Training Command's version.

In conclusion, history is replete with groundbreaking ideas that, if revisited, can offer solutions to modern challenges. The early days of data abstraction serve as a reminder that sometimes, the answers we seek lie in the wisdom of the past.

**The Dark ages of Environments: The Rise of Dependencies**

In the ever-evolving landscape of software development, one of the most notable shifts has been the increasing reliance on dependencies. As our programs have grown in complexity, so too has the intricate web of tools, libraries, and frameworks they rely on. At the heart of this shift is the concept of dependencies and the systems we've developed to manage them.

Historically, software was often built from scratch, with every component crafted in-house. However, as the industry matured, developers began to recognize the value of reusing code and leveraging pre-built solutions. Why reinvent the wheel when someone else has already created a tool that fits your needs?

Enter the era of dependencies. These are essentially external pieces of code or libraries that a software project relies on to function. Instead of writing every single function or feature from scratch, developers can now incorporate pre-existing solutions, streamlining the development process and fostering a more collaborative coding environment.

However, with this newfound efficiency came a new set of challenges. As projects grew to depend on multiple external libraries, ensuring compatibility and managing versions became a daunting task. This is where package managers come into play.

Package managers, as of this writing, have become an indispensable tool in the developer's toolkit. They automate the process of installing, upgrading, configuring, and removing software packages. Think of them as the middlemen, ensuring that all the different pieces of a software project play nicely together. They resolve the environment in which we work, ensuring that the correct versions of each dependency are used.

But beyond just managing dependencies, there's a broader concept at play: virtualization. This idea, that we can create isolated, replicable, and controlled environments for our software, is foundational to modern development. Virtualization ensures that software runs consistently across different systems and stages, from a developer's local machine to a production server.

In our quest for optimization and efficiency, we've inadvertently added an extra layer to our development process. Before diving into the actual coding, developers now first ensure that their environment, complete with all its dependencies, is set up correctly. This layer, sitting atop the foundational codebase, is what we've come to know as our dependency layer.

Predictions, speculative but this is what GREB is all about 

The dawn of the 21st century witnessed a paradigm shift in software development. Engineers, initially enamored by the efficiency of dependencies and package managers, soon confronted the pitfalls of their own creations. The increased complexity of systems, while initially promising, led to numerous "yikes moments" - instances where things broke, became awkward, or simply failed to work. This wasn't just a result of the intricate nature of these systems, but also the unintuitive processes they entailed. Debugging became a Herculean task, and the practice of importing massive libraries just to utilize a single line of code became commonplace.

Before the era of AI-assisted computing, it was simpler to import these hefty packages than to request the system to dissect them and extract only the necessary functionalities. However, with the advent of AI, developers found it quicker to ask the AI to craft what they needed. While this did introduce some code duplication, it also paved the way for a more streamlined approach, where software could be shipped with minimal dependencies.

Yet, as systems evolved, they became bloated with outdated dependencies, leading to unwieldy libraries. The concept of microservices, which aimed to break down applications into smaller, more manageable pieces, was a step in the right direction. However, by 2020, setting up such infrastructures was still a complex and often confusing task.

The true revolution came when systems began to self-optimize. The ability to dynamically adjust architecture, reorganize code, and request the system to run optimization calculations transformed software development. Even 55 years post the iconic "Mother of All Demos", programming was still in its infancy. Many functionalities, once considered essential, were discarded over time, primarily due to corporate-driven agendas. The complexity of these systems was so overwhelming that those without an engineering background, or a foundation in mathematical thinking, found it challenging to grasp.

It's intriguing to imagine a world where individuals interacted with computers daily, yet had little understanding of their inner workings. However, the tide turned when integrated visualization tools, combined with subconscious-friendly techniques, simplified programming. Instead of navigating through extensive documentation, users could now click on a running process and modify its behavior in real-time. Such a concept, which would have wreaked havoc on systems in 2020, became the norm.

The democratization of computer science proved pivotal. It wasn't just about making systems user-friendly; it was about empowering individuals to customize and understand the digital universes they interacted with daily. This shift towards a more intuitive, user-driven approach to software development played a crucial role in transitioning societies from a work-centric model to one focused on holistic human betterment.

In retrospect, it's evident that the evolution of computer science was not just a technological journey but a societal one. It would indeed have been a tragedy if the wonders of this field had remained confined to an elite few. After all, humanity's evolutionary journey has always been geared towards understanding and shaping complex universes, both digital and tangible.
