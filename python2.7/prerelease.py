import datetime

#object which holds table's values + no. components sold
#[component][component type]
# -> [0] = price
# -> [1] = stock
# -> [2] = no. sold
components={
    'processor':{
        'p3':[100, 2, 0],
        'p5': [120, 1, 0],
        'p7': [200, 3, 0],
    },
    'ram':{
            '16GB':[75, 2, 0],
            '32GB': [150, 1, 0],
    },
    'storage':{
            '1TB':[50, 2, 0],
            '2TB': [100, 4, 0],
    },
    'screen':{
            '19"':[65, 1, 0],
            '23"': [120, 2, 0],
    },
    'case':{
            'Mini Tower':[40, 1, 0],
            'Midi Tower': [70, 2, 0],
    },
    'usb ports':{
            '2 ports':[10, 1, 0],
            '4 ports': [20, 2, 0],
    }
}

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

ordernumbers=[]#is explicitly required in task 2
estimateno = 1
ordervalues=[]
done = False
while not done:
    choices={}
    #choices
    for component in components:
        opts = components[component].keys()
        print("Please select your desired "+component+" (1-"+str(len(opts))+"): ")
        counter=0
        for opt in opts:
            counter+=1
            print(str(counter) + ") " + opt + " - $" + str(components[component][opt][0]) + " - " + str(components[component][opt][1]) + " in stock.") #does not explicitly say to show stock in task but impl anyway

        while True:
            input=raw_input()
            if(not input.isdigit()):
                print("Please input digits only. Please enter a number (1-" + str(counter) + "). Please try again.")
                continue
            try:
                selection = int(input)
                if(selection<1 or selection>counter):
                    print("Selection out of range. Please enter a number (1-" + str(counter) + "). Please try again.")
                    continue
            except:
                #should theoretically never happen
                print("Internal error parsing input. Please try again.")
                continue
            choices[component]=opts[selection-1]
            break

    #estimation summary
    summary='' #because need to use this twice
    estimate = 0
    for component in choices:
        selected = choices[component] #otherwise may get 'too many values to unpack' error
        price = components[component][selected][0] #because will be used twice
        estimate+=price
        summary+=(component+": "+selected+" - $"+str(price))+'\n'
    estimate*=1.2 #add 20%

    print('')#print linebreak
    print "Estimation Summary:"
    print "Estimation number: "+str(estimateno)
    print(summary)
    print("Estimated total cost: $"+str(estimate))
    print('')

    if getChoice('Would you like to order this?'):
        instock = True
        for component in choices:
            if(components[component][choices[component]][1]<=0):
                instock = False
                break

        if not instock:
            print('Unfortunately, one or more of your selected components are out of stock. Please try again later.')
        else:
            #'update stock levels'
            for component in choices:
                components[component][choices[component]][1]-=1
                components[component][choices[component]][2] += 1 #need for task 3
            ordernumbers.append(estimateno) #'add the unique estimate number to the list of order numbers'
            ordervalues.append(estimate) #need for task 3

            #assuming 'add the customer's details' means add it to the order summary output (as opp. to add to a list?)
            #using string here so can be changed to physical print easily if need be (question ambiguous)
            ordersummary=''
            ordersummary+='\n'
            ordersummary +=("Order Summary:\n")
            ordersummary +="Estimation number: "+str(estimateno)+"\n"
            ordersummary+=(summary+'\n') #assuming order summary needs to show components selected
            ordersummary+=("Estimated total cost: $" + str(estimate)+'\n')
            ordersummary+=('------------------------------'+'\n')
            ordersummary+=("Customer's details: " + raw_input('Please enter your details.\n')+'\n') #because doesn't really specify what type of details
            ordersummary+=("Date: " + str(datetime.datetime.now().date())+'\n\n')

            for counter in range(2): #'print two copies' assuming print means print to console
                print(("Customer Copy:" if counter % 2 == 0 else "Shop Copy:") + ordersummary)

    print('')
    if not getChoice('Is there another order?'):
        done = True
        break
    estimateno += 1

#task 3
print("End of day Summary:")
print("Total orders made: "+str(len(ordernumbers)))
sumsales = 0
counter=1
for sale in ordervalues:
    print("\tOrder #"+str(counter)+" - $"+str(sale))
    sumsales+=sale
    counter+=1
print("Total value of the orders: $" + str(sumsales)) #assuming 'showing the total (...) value of the orders' (ambiguous)
for component in components:
    print(component+" sales:")
    for type in components[component]:
        print("\t"+type+": "+str(components[component][type][2]))
