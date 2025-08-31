# Create TO-DO list using functions
#!/bin/bash

# Create TO-DO file to store task
TODO_File="TODO.txt"

# Get ToDo file
touch "$TODO_File"


# Display Menu for TODO functions.
show_menu() {
	echo "===== TO-DO List ====="
	echo "1. View Task"
	echo "2. Add Task"
	echo "3. Edit Task"
	echo "4. Remove Task"
	echo "5. Exit"
	echo "----------------------"
}

# View Task
viewTask() {
	if [ ! -s "$TODO_File" ]; then
		echo "No pending tasks!"
	else
	     nl -w2 -s"." "$TODO_File"
	fi
}

# Add Task
addTask() {
	read -p "Enter new task : " task
	if [ -n "$task" ]; then
		echo "$task" >> "$TODO_File"
		echo "Task Added to ToDo list."
	else
		echo "Task cannot be empty."
	fi
}

# Edit Task
editTask() {
	if [ ! -s "$TODO_File" ]; then
		echo "No task to edit."
		return
	fi
	
	viewTask
	read -p "Enter task number to edit: " num
	
	total_lines=$(wc -l < "$TODO_File")
	if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "$total_lines" ]; then
		old_task=$(sed -n "${num}p" "$TODO_File")
		echo "Current task: $old_task"
		read -p "Enter new task: " newTask

	if [ -n "$newTask" ]; then
		sed -i "${num}s/.*/$newTask/" "$TODO_File"
		echo "Task Updated!"
	else
		echo "New task cannot be empty."
	fi
	else
		echo "Invalid Input: Enter a number between 1 and $total_lines."
	fi
}

# Remove Task
removeTask() {
	viewTask
	read -p "Enter task number to remove : " num
	if [[ "$num" =~ ^[0-9]+$ ]]; then
	     sed -i "${num}d" "$TODO_File"
	     echo "Task Removed from ToDo List."
	else
	     echo "Invalid Input."
	fi
}



# Main loop 
while true; do
	show_menu
	read -p "Choose an option [1-5] : " choose
	case $choose in
		1) viewTask ;;
		2) addTask ;;
		3) editTask ;;
		4) removeTask ;;
		5) echo "GoodBye!"; exit 0 ;;
		*) echo "Invalid choice. Please try again." ;;
	esac
done
