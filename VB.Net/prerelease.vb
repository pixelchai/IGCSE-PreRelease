Imports System
Imports System.Collections.Generic

Namespace prerelease
	Friend Class PreRelease
		Private Shared Function GetChoice(Optional prompt As String="Yes or no?") As Boolean
			Console.WriteLine(prompt + " (y/n)")
			Dim input As String = Console.ReadLine().ToLower()
			While True
				Dim flag As Boolean = input = "n"
				If flag Then
					Exit While
				End If
				Dim flag2 As Boolean = input = "y"
				If flag2 Then
					GoTo Block_2
				End If
				Console.WriteLine("Please input 'y' for yes and 'n' for no. Please try again:")
				input = Console.ReadLine().ToLower()
			End While
			Dim result As Boolean = False
			Return result
			Block_2:
			result = True
			Return result
		End Function

		Private Shared Sub Main(args As String())
			Dim component_types As String() = New String() { "processor", "ram", "storage", "screen", "case", "usb ports" }
			Dim section_lengths As Integer() = New Integer() { 3, 2, 2, 2, 2, 2 }
			Dim components As String() = New String() { "p3", "p5", "p7", "16GB", "32GB", "1TB", "2TB", "19""", "23""", "Mini Tower", "Midi Tower", "2 ports", "4 ports" }
			Dim prices As Integer() = New Integer() { 100, 120, 200, 75, 150, 50, 100, 65, 120, 40, 70, 10, 20 }
			Dim stock As Integer() = New Integer() { 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 }
			Dim num_components_sold As Integer() = New Integer(12) {}
			Dim order_numbers As List(Of Integer) = New List(Of Integer)()
			Dim estimate_no As Integer = 1
			Dim order_values As List(Of Double) = New List(Of Double)()
			Dim done As Boolean = False
			While Not done
				Dim choices As List(Of Integer) = New List(Of Integer)()
				Dim offset As Integer = 0
				For component_type_index As Integer = 0 To component_types.Length - 1
					Dim section_length As Integer = section_lengths(component_type_index)
					Console.WriteLine(String.Concat(New Object() { "Please select your desired ", component_types(component_type_index), " (1-", section_length, "): " }))
					For relative_component_index As Integer = 0 To section_length - 1
						Dim absolute_component_index As Integer = offset + relative_component_index
						Console.WriteLine(String.Concat(New Object() { relative_component_index + 1, ") ", components(absolute_component_index), " - $", prices(absolute_component_index), " - ", stock(absolute_component_index), " in stock." }))
					Next
					Dim selection As Integer
					While True
						Dim input As String = Console.ReadLine()
						Dim flag As Boolean = Not Integer.TryParse(input, selection)
						If flag Then
							Console.WriteLine("Error parsing input. Please input digits only. Please enter a number (1-" + section_length + "). Please try again.")
						Else
							Dim flag2 As Boolean = selection < 1 OrElse selection > section_length
							If Not flag2 Then
								Exit While
							End If
							Console.WriteLine("Selection out of range. Please enter a number (1-" + section_length + "). Please try again.")
						End If
					End While
					choices.Add(offset + selection - 1)
					offset += section_length
				Next
				Dim summary As String = ""
				Dim estimate As Double = 0.0
				For choice_index As Integer = 0 To choices.Count - 1
					Dim price As Double = CDec(prices(choices(choice_index)))
					estimate += price
					summary = String.Concat(New Object() { summary, component_types(choice_index), ": ", components(choices(choice_index)), " - $", price, Environment.NewLine })
				Next
				estimate *= 1.2
				Console.WriteLine("Estimation Summary:")
				Console.WriteLine("Estimation number: " + estimate_no)
				Console.WriteLine(summary)
				Console.WriteLine("Estimated total cost: $" + estimate)
				Dim choice As Boolean = PreRelease.GetChoice("Would you like to order this?")
				If choice Then
					Dim is_in_stock As Boolean = True
					For Each choice_index2 As Integer In choices
						Dim flag3 As Boolean = stock(choice_index2) <= 0
						If flag3 Then
							is_in_stock = False
							Exit For
						End If
					Next
					Dim flag4 As Boolean = Not is_in_stock
					If flag4 Then
						Console.WriteLine("Unfortunately, one or more of your selected components are out of stock. Please try again later.")
					Else
						For Each choice_index3 As Integer In choices
							stock(choice_index3) -= 1
							num_components_sold(choice_index3) += 1
						Next
						order_numbers.Add(estimate_no)
						order_values.Add(estimate)
						Dim order_summary As String = ""
						order_summary = order_summary + "Order Summary:" + Environment.NewLine
						order_summary = String.Concat(New Object() { order_summary, "Estimation number: ", estimate_no, Environment.NewLine })
						order_summary = order_summary + summary + Environment.NewLine
						order_summary = String.Concat(New Object() { order_summary, "Estimated total cost: $", estimate, Environment.NewLine })
						order_summary = order_summary + "------------------------------" + Environment.NewLine
						Console.WriteLine("Please enter your details:")
						Dim input2 As String = Console.ReadLine()
						order_summary = order_summary + "Customer's details: " + input2 + Environment.NewLine
						order_summary = order_summary + "Date: " + DateTime.Now
						For counter As Integer = 0 To 2 - 1
							Dim flag5 As Boolean = counter Mod 2 = 0
							If flag5 Then
								Console.WriteLine("Customer Copy:")
							Else
								Console.WriteLine("Shop Copy:")
							End If
							Console.WriteLine(order_summary)
						Next
					End If
				End If
				Dim flag6 As Boolean = Not PreRelease.GetChoice("Is there another order?")
				If flag6 Then
					done = True
					Exit While
				End If
				estimate_no += 1
			End While
			Console.WriteLine("End of day Summary:")
			Dim num_orders As Integer = order_numbers.Count
			Dim total_value As Double = 0.0
			For index As Integer = 0 To num_orders - 1
				Console.WriteLine(String.Concat(New Object() { vbTab & "Order number ", order_numbers(index), " - $", order_values(index) }))
				total_value += order_values(index)
			Next
			Console.WriteLine("Total value of the orders: $" + total_value)
			Console.WriteLine("Total component sales:")
			For index2 As Integer = 0 To components.Length - 1
				Console.WriteLine(String.Concat(New Object() { vbTab, components(index2), ": ", num_components_sold(index2) }))
			Next
		End Sub
	End Class
End Namespace
