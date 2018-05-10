import datetime

component_types = ['processor', 'ram', 'storage', 'screen', 'case', 'usb ports']
section_lengths = [3, 2, 2, 2, 2, 2]
components = ['p3', 'p5', 'p7', '16GB', '32GB', '1TB', '2TB', '19"', '23"', 'Mini Tower', 'Midi Tower', '2 ports', '4 ports']
prices = [100, 120, 200, 75, 150, 50, 100, 65, 120, 40, 70, 10, 20]
stock = [1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
num_components_sold = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

def getChoice(prompt="Yes or no?"):
    input = raw_input(prompt + " (y/n)\n").lower()
    while True:
        if input == 'n':
            return False
        elif input == 'y':
            return True
        else:
            print("Please input 'y' for yes and 'n' for no. Please try again")
            input = raw_input().lower()


order_numbers = []
estimate_no = 1
order_values = []
done = False
while not done:
    choices = []
    offset = 0
    for component_type_index in range(len(component_types)):
        section_length = section_lengths[component_type_index]
        print("Please select your desired " + component_types[component_type_index] + " (1-" + str(section_length) + "): ")

        for relative_component_index in range(section_length):
            absolute_component_index = offset + relative_component_index
            print(str(relative_component_index + 1) + ") " + components[absolute_component_index] + " - $" + str(prices[absolute_component_index]) + " - " + str(stock[absolute_component_index]) + " in stock.")

        while True:
            input = raw_input()
            if (not input.isdigit()):
                print("Please input digits only. Please enter a number (1-" + str(section_length) + "). Please try again.")
                continue
            try:
                selection = int(input)
                if (selection < 1 or selection > section_length):
                    print("Selection out of range. Please enter a number (1-" + str(section_length) + "). Please try again.")
                    continue
            except:
                print("Internal error parsing input. Please try again.")
                continue
            choices.append(offset + selection - 1)
            break
        offset += section_length

    summary = ''
    estimate = 0
    for component_type_index in range(len(choices)):
        price = prices[choices[component_type_index]]
        estimate += price
        summary += component_types[component_type_index] + ": " + components[choices[component_type_index]] + " - $" + str(price) + '\n'
    estimate *= 1.2

    print('')
    print("Estimation Summary:")
    print("Estimation number: " + str(estimate_no))
    print(summary)
    print("Estimated total cost: $" + str(estimate))
    print('')

    if getChoice('Would you like to order this?'):
        is_in_stock = True
        for choice in choices:
            if(stock[choice]<=0):
                is_in_stock=False
                break

        if not is_in_stock:
            print('Unfortunately, one or more of your selected components are out of stock. Please try again later.')
        else:
            for choice in choices:
                stock[choice]-=1
                num_components_sold[choice]+=1
            order_numbers.append(estimate_no)
            order_values.append(estimate)

            order_summary = '\n'
            order_summary += "Order Summary:\n"
            order_summary += "Estimation number: " + str(estimate_no) + "\n"
            order_summary += summary + '\n'
            order_summary += "Estimated total cost: $" + str(estimate) + '\n'
            order_summary += '------------------------------' + '\n'
            order_summary += "Customer's details: " + raw_input('Please enter your details:\n') + '\n'
            order_summary += "Date: " + str(datetime.datetime.now().date()) + '\n\n'

            for counter in range(2):
                print(("Customer Copy:" if counter % 2 == 0 else "Shop Copy:") + order_summary)

        if not getChoice('Is there another order?'):
            done = True
            break
        estimate_no+=1

print("End of day Summary:")
num_orders=len(order_numbers)
print("Total orders made: " + str(num_orders))
total_value=0
for num in range(num_orders):
    print("\tOrder number " + str(order_numbers[num]) + " - $" + str(order_values[num]))
    total_value+=order_values[num]
print("Total value of the orders: $" + str(total_value))
print("Total component sales:")
for num in range(len(components)):
    print("\t" + components[num] +": " + str(num_components_sold[num]))