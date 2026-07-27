import  psutil

def get_system_metrics():
    """
    This API gets the System Metrics(CPU, Memory, Disk. System Health)
    Based on a CPU Threashold i.e 10 (Configurable)
    """
    cpu_percent=psutil.cpu_percent(interval=1)
    memory_percent=psutil.virtual_memory().percent
    disk_percent=psutil.disk_usage("/").percent

    cpu_threshold = 10
    #status = "High CPU" if cpu_percent>cpu_threshold else status = "Healthy"
    if cpu_percent > cpu_threshold:
        status="High CPU detected"
    else:
        status="Healthy"
    return{
        "cpu_percentage" : cpu_percent,
        "memory_percentage" : memory_percent,
        "disk_percentage" : disk_percent,  
        "cpu_threshold" : cpu_threshold,
        "system_status" : status,
    }


# sys_log=get_system_metrics()
# print(sys_log)
