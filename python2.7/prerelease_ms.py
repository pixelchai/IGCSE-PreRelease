import datetime
componentnames=['processor','ram','storage','screen','case','usb ports']
sections=[3,2,2,2,2,2]
componentoptions=['p3','p5','p7','16GB','32GB','1TB','2TB','19"','23"','Mini Tower','Midi Tower','2 ports','4 ports']
prices=[100,120,200,75,150,50,100,65,120,40,70,10,20]
stock=[1,5,5,5,5,5,5,5,5,5,5,5,5]
nosold=[0,0,0,0,0,0,0,0,0,0,0,0,0]

#seperated this into function because used more than once
def getChoice(prompt="Yes or no?"):
    input = raw_input(prompt+" (y/n)\n").lower()
    while True:
        if input == 'n':
            return False
        elif input == 'y':
            return True
        else:
            print("Please input 'y' for yes and 'n' for no. Please try again")
            input=raw_input().lower()
            
ordernumbers=[]
estimateno=1
saleslist=[]
done = False #ms fallback
while not done:
    choices=[]
    offset=0
    for i in range(len(componentnames)):
        curl=sections[i]
        print("Please select your desired "+componentnames[i]+" (1-"+str(curl)+"): ")
        
        for j in range(curl):
            curi=offset+j
            print(str(j+1)+") "+componentoptions[curi]+" - $"+str(prices[curi])+" - "+str(stock[curi])+" in stock.")
        
        while True: #need ms fallback here
            input=raw_input()
            if(not input.isdigit()):
                print("Please input digits only. Please enter a number (1-" + str(curl) + "). Please try again.")
                continue
            try:
                selection = int(input)
                if(selection<1 or selection>curl):
                    print("Selection out of range. Please enter a number (1-" + str(curl) + "). Please try again.")
                    continue
            except:
                #should theoretically never happen
                print("Internal error parsing input. Please try again.")
                continue
            choices.append(offset+selection-1)
            print(choices)
            break
        
        #TODO SUMMARY
        
        offset+=curl
    break #TEMP