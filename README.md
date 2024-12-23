# OpiTool

**OpiTool** is a batch script that automates several system optimization tasks on Windows. It helps improve system performance by cleaning up unnecessary files, optimizing system settings, and disabling unused services. The script is easy to use, and you can choose which tasks to perform from an interactive menu.

## Features

- **Delete unnecessary files**: Cleans up Temp and Prefetch folders.
- **Set Time Resolution**: Adjusts the system's time resolution to 1 millisecond for better performance.
- **Change Power Plan**: Switches to the "High Performance" power plan or "Ultimate Performance" if supported.
- **Clear DNS Cache**: Clears DNS cache to fix network issues.
- **Disable Animations and Visual Effects**: Reduces system resource usage by disabling unnecessary animations.
- **Free Up Memory (RAM)**: Frees up system memory (RAM) by triggering garbage collection.
- **Disable Unnecessary Services**: Disables unnecessary background services to improve performance.
- **Create a System Restore Point**: Creates a restore point so you can revert the system to a previous state.
- **Clear System Logs**: Clears application and system logs to reduce disk usage.

## How to Use

1. **Download the script**:
   - Download the `OpiTool.bat` file to your computer.

2. **Run the script as Administrator**:
   - Right-click on the batch file and select **Run as Administrator** to ensure the program has the necessary permissions for certain tasks.

3. **Choose an option**:
   - After running the script, an interactive menu will appear. Choose a task by entering the number next to the option you want to run and press **Enter**.

4. **Wait for the task to complete**:
   - Once a task is completed, the script will display a confirmation message.

5. **Repeat or Exit**:
   - After completing a task, you will return to the menu, where you can select another option or exit the program by choosing **0**.

## Available Tasks

1. **Delete unnecessary files (Temp and Prefetch)**: Removes unnecessary temporary files to free up space.
2. **Set Time Resolution to 1ms**: Sets the system time resolution to 1 millisecond.
3. **Change Power Plan to High Performance**: Switches to the "High Performance" or "Ultimate Performance" power plan.
4. **Clear DNS Cache**: Clears the DNS cache to resolve network connectivity issues.
5. **Disable Animations and Visual Effects**: Disables unnecessary animations and visual effects to improve system responsiveness.
6. **Free Up Memory (RAM)**: Frees up system memory by invoking garbage collection.
7. **Disable Unnecessary Services**: Disables background services like Windows Update to free up system resources.
8. **Create a System Restore Point**: Creates a restore point to allow you to roll back to a previous system state if necessary.
9. **Clear System Logs**: Clears application and system logs to reduce disk usage.

0. **Exit**: Exits the program.

## Important Notes

- **Run as Administrator**: Some options, such as changing the power plan or disabling services, require administrative privileges. Make sure to run the script as an administrator.
- **System Restore**: It is recommended to create a system restore point before performing optimizations, especially if you're unfamiliar with some of the tasks. This allows you to revert to a previous system state if needed.
- **Task Effects**: Be cautious when disabling services or clearing logs, as this can impact system behavior or prevent troubleshooting in case of future issues.

---

Enjoy a faster and more efficient system with **OpiTool**!
