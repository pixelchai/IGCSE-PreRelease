components={
    'processor':{
        'p3':[100,10],
        'p5': [120, 10],
        'p7': [200, 10],
    },
    'ram':{
            '16GB':[75,10],
            '32GB': [150, 10],
    },
    'storage':{
            '1TB':[50,10],
            '2TB': [100, 10],
    },
    'screen':{
            '19"':[65,10],
            '23"': [120, 10],
    },
    'case':{
            'Mini Tower':[40,10],
            'Midi Tower': [70, 10],
    },
    'usb ports':{
            '2 ports':[10,10],
            '4 ports': [20, 10],
    }
}
ordernumbers=[]#is explicitly required in task 2
orderno = 1
done = False
while not done:
    choices={}
    #choices
    for component in components:
        print("Please select your desired "+component+":")
        opts = components[component].keys()
        i=0
        for opt in opts:
            i+=1
            print(str(i)+") "+opt +" - $"+str(components[component][opt][0]))

        while True:
            input=raw_input()
            if(not input.isdigit()):
                print("Input was not digits only. Please enter a number (1-"+str(i)+"). Please try again.")
                continue
            try:
                selection = int(input)
                if(selection<1 or selection>i):
                    print("Selection out of range. Please enter a number (1-" + str(i) + "). Please try again.")
                    continue
            except:
                #this theoretically should never happen
                print("Internal error parsing input. Please try again.")
                continue
            print str(i)
            choices[component]=opts[selection-1]
            break

    print "Estimation Summary:"
    estimate = 0
    for component in choices:
        selected = choices[component] #otherwise may get 'too many values to unpack' error
        price = components[component][selected][0] #because will be used twice
        estimate+=price
        print(component+": "+selected+" - $"+str(price))
    estimate*=1.2 #add 20%
    print('------------------------------')
    print("Estimated total cost: $"+str(estimate))

    print('\n')
    input = raw_input("Another order? (y/n)\n")
    while True:
        if input=='n':
            done=True
            break
        elif input == 'y': break
        else: print("Please input 'y' for yes and 'n' for no. Please try again")
    orderno+=1
