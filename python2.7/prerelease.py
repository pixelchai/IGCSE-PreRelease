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
    'Case':{
            'Mini Tower':[40,10],
            'Midi Tower': [70, 10],
    },
    'USB ports':{
            '2 ports':[10,10],
            '4 ports': [20, 10],
    }
}

#task 1 - produce an estimate
choices=[]
#choices
for component in components:
    print("Please enter your desired "+component+" no:")
    i=1
    for opt in components[component]:
       print(str(i)+") "+opt)
       i+=1
