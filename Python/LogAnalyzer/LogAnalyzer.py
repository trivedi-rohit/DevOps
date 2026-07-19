# import pdb
import json

class LogAnalyzer:
    
    def __init__(self,file_name,output_file):
        self.file_name = file_name
        self.output_file = output_file


    def read_logs(self):
        
        with open (self.file_name,"r") as file:
            return file.readlines()


    def write_json_file(self, counts):
        # pdb.set_trace()
        with open(self.output_file,"w") as json_file:
            json.dump(counts, json_file, indent=4)
        return counts
        
        
    def print_log(self, counts):
        print("Log counts are:")
        for level, count in counts.items():
            print(f"{level}: {count}")
        return counts
        

    def analyze_logs(self):
    
        logs_count = {
            "INFO": 0,
            "WARNING": 0,
            "ERROR": 0
        }
        lines = self.read_logs()

        for linee in lines:
            if "INFO" in linee:
                logs_count.update({"INFO": logs_count["INFO"]+1}) 
            elif "WARNING" in linee:
                logs_count.update({"WARNING": logs_count["WARNING"]+1})
            elif "ERROR" in linee:
                logs_count.update({"ERROR": logs_count["ERROR"]+1})
            else:
                pass
        return self.write_json_file(logs_count)




log1 = LogAnalyzer("app.log","output1.json")
logs_count = log1.analyze_logs()
log1.write_json_file(logs_count)

log2 = LogAnalyzer("app1.log","output2.json")
logs_count = log2.analyze_logs()
log2.write_json_file(logs_count)