using System;
using System.Collections.Generic;

namespace prerelease
{
    class PreRelease
    {
        static bool GetChoice(string prompt = "Yes or no?")
        {
            Console.WriteLine(prompt + " (y/n)");
            string input = Console.ReadLine().ToLower();
            while (true)
            {
                if (input == "n") return false;
                else if (input == "y") return true;
                else
                {
                    Console.WriteLine("Please input 'y' for yes and 'n' for no. Please try again:");
                    input = Console.ReadLine().ToLower();
                }
            }
        }
        static void Main(string[] args)
        {
            string[] component_types = new string[] { "processor", "ram", "storage", "screen", "case", "usb ports" };
            int[] section_lengths = new int[] { 3, 2, 2, 2, 2, 2 };
            string[] components = new string[] { "p3", "p5", "p7", "16GB", "32GB", "1TB", "2TB", "19\"", "23\"", "Mini Tower", "Midi Tower", "2 ports", "4 ports" };
            int[] prices = new int[] { 100, 120, 200, 75, 150, 50, 100, 65, 120, 40, 70, 10, 20 };
            int[] stock = new int[] { 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 };
            int[] num_components_sold = new int[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

            List<int> order_numbers = new List<int>();
            int estimate_no = 1;
            List<double> order_values = new List<double>();
            bool done = false;
            while (!done)
            {
                List<int> choices = new List<int>();
                int offset = 0;
                for (int component_type_index = 0; component_type_index < component_types.Length; component_type_index++)
                {
                    int section_length = section_lengths[component_type_index];
                    Console.WriteLine("Please select your desired " + component_types[component_type_index] + " (1-" + section_length + "): ");

                    for (int relative_component_index = 0; relative_component_index < section_length; relative_component_index++)
                    {
                        int absolute_component_index = offset + relative_component_index;
                        Console.WriteLine((relative_component_index + 1) + ") " + components[absolute_component_index] + " - $" + prices[absolute_component_index] + " - " + stock[absolute_component_index] + " in stock.");
                    }

                    while (true)
                    {
                        string input = Console.ReadLine();
                        int selection;
                        if (!int.TryParse(input, out selection))
                        {
                            Console.WriteLine("Error parsing input. Please input digits only. Please enter a number (1-" + section_length + "). Please try again.");
                            continue;
                        }
                        else if (selection < 1 || selection > section_length)
                        {
                            Console.WriteLine("Selection out of range. Please enter a number (1-" + section_length + "). Please try again.");
                            continue;
                        }
                        choices.Add(offset + selection - 1);
                        break;
                    }
                    offset += section_length;
                }

                string summary = "";
                double estimate = 0;
                for (int choice_index = 0; choice_index < choices.Count; choice_index++)
                {
                    double price = prices[choices[choice_index]];
                    estimate += price;
                    summary += component_types[choice_index] + ": " + components[choices[choice_index]] + " - $" + price + Environment.NewLine;
                }
                estimate *= 1.2;

                Console.WriteLine("Estimation Summary:");
                Console.WriteLine("Estimation number: " + estimate_no);
                Console.WriteLine(summary);
                Console.WriteLine("Estimated total cost: $" + estimate);

                if (GetChoice("Would you like to order this?"))
                {
                    bool is_in_stock = true;
                    foreach (int choice_index in choices)
                    {
                        if (stock[choice_index] <= 0)
                        {
                            is_in_stock = false;
                            break;
                        }
                    }

                    if (!is_in_stock)
                    {
                        Console.WriteLine("Unfortunately, one or more of your selected components are out of stock. Please try again later.");
                    }
                    else
                    {
                        foreach (int choice_index in choices)
                        {
                            stock[choice_index] -= 1;
                            num_components_sold[choice_index] += 1;
                        }
                        order_numbers.Add(estimate_no);
                        order_values.Add(estimate);

                        string order_summary = "";
                        order_summary += "Order Summary:" + Environment.NewLine;
                        order_summary += "Estimation number: " + estimate_no + Environment.NewLine;
                        order_summary += summary + Environment.NewLine;
                        order_summary += "Estimated total cost: $" + estimate + Environment.NewLine;
                        order_summary += "------------------------------" + Environment.NewLine;
                        Console.WriteLine("Please enter your details:");
                        string input = Console.ReadLine();
                        order_summary += "Customer's details: " + input + Environment.NewLine;
                        order_summary += "Date: " + DateTime.Now;

                        for (int counter = 0; counter < 2; counter++)
                        {
                            if (counter % 2 == 0) Console.WriteLine("Customer Copy:");
                            else Console.WriteLine("Shop Copy:");
                            Console.WriteLine(order_summary);
                        }
                    }
                }
                if (!GetChoice("Is there another order?"))
                {
                    done = true;
                    break;
                }
                estimate_no += 1;
            }

            Console.WriteLine("End of day Summary:");
            int num_orders = order_numbers.Count;
            double total_value = 0;
            for (int index = 0; index < num_orders; index++)
            {
                Console.WriteLine("\tOrder number " + order_numbers[index] + " - $" + order_values[index]);
                total_value += order_values[index];
            }
            Console.WriteLine("Total value of the orders: $" + total_value);
            Console.WriteLine("Total component sales:");
            for (int index = 0; index < components.Length; index++)
            {
                Console.WriteLine("\t" + components[index] + ": " + num_components_sold[index]);
            }
        }
    }
}