# Create ToDo List using while loop
#!/bin/bash

TODO_FILE="todo.txt"
touch "$TODO_FILE"

while true; do
    echo "=== Simple To-Do List ==="
    echo "1. View tasks"
    echo "2. Add a task"
    echo "3. Remove a task"
    echo "4. Exit"

    read -p "Choose an option [1-4]: " choice

    case $choice in
        1) # View Task
            echo "--- Your Tasks ---"
            if [[ ! -s "$TODO_FILE" ]]; then
                echo "No tasks found."
            else
                nl -w2 -s". " "$TODO_FILE"
            fi
            ;;
        2) # Add Task
            read -p "Enter the task: " task
            echo "$task" >> "$TODO_FILE"
            echo "Task added!"
            ;;
        3) # Remove Task
            nl -w2 -s". " "$TODO_FILE"
            read -p "Enter the task number to remove: " num
            if [[ "$num" =~ ^[0-9]+$ ]]; then
                sed -i "${num}d" "$TODO_FILE"
                echo "Task removed."
            else
                echo "Invalid number."
            fi
            ;;
        4) # Exit
            echo "Goodbye!"
            exit 0
            ;;
        *) # For incorrect input
            echo "Invalid option. Please enter 1-4."
            ;;
    esac
done
