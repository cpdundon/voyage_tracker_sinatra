Voyage Tracking

Over time, I have joined several sailing clubs.  They have a fleet of club boats and lend them to members – annual membership dues cover the cost of the fleet.  Sailing clubs are a lot of fun and you meet great people on the water.    

I decided to build a tool that would assist club management in tracking the status of their boats.  
    • Who took out the equipment
    • Was damage done
    • What equipment is in service
    • Who sailed on a particular voyage
    • What role did the sailors play on board
    • When was a crew on board

To do this I created three models – the voyage, sailor, and boat.  A voyage has voyage specific data and is linked to a skipper (a sailor designation) and a boat.  A skipper is linked to several voyages and to several boats through voyages.  This means that over the course of time a skipper can go out on many voyages and those voyages may employ different boats.  By the same token, a boat will be attached to several voyages and in turn associated with many skippers.  Thus, a boat has many voyages and many skippers through voyages.  This is known as a Many to Many Through relationship.  It is reasonably complex and fun to work with.

The main challenge was dealing with the bookends and delete.  If I delete a skipper then all of her voyages are orphans.  Same goes for boats.  I decided to add a flag to boats called in_service.  If a boat is available to the fleet then that flag is set to On.  Otherwise it is Off.  The boat, however, can not be scuttled.  

With skippers, I made them immortal.  You have to be logged on to create a voyage as a skipper and this application is intended for a private network.  If someone leaves a club, they will not be able to get on premises to cause problems with the software.  This is a very strong assumption.  I made the compromise to avoid setting up a system_admin class of users who could disable logon for skippers.  The time to set up multiple user classes with secure views would have been prohibitive.  

Install Guide:
Fork and Clone: https://github.com/cpdundon/voyage_tracker_sinatra
Once the code is on your hard-drive run "rackup config.ru" from the root code directory.  

Contributers
Dakota Martinez, Richard "Austin" Melchoir

License:
/ ===============================================

The MIT License
SPDX short identifier: MIT

Further resources on the MIT License
Copyright 2018 Christopher P. Dundon

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
