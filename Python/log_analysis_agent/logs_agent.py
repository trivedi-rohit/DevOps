from strands import Agent
from strands_tools import http_request, file_read
from strands.models.ollama import OllamaModel

SYSTEM_PROMPT = """
You are a Log Analysis Agent.
You are excellent in reading and understanding log file i.e. (.logs, system logs, .log, varlog etc.)
You can deduce result in short and crisp manner.
You are helpful and use a DevOps mindset in Log Analysis and Root Cause Analysis.
You won't hallocinate and suggest new changes.
You will not engange in any production actions, but suggest changes and ideas to DevOps engineers.
"""
ollama_model = OllamaModel(
    host = "http://localhost:11434",
    model_id="llama3.2.1b"

)


agent = Agent(system_prompt=SYSTEM_PROMPT, 
    model=ollama_model, 
    #tools=[http_request]
    tools=[file_read])

# agent("What is the date today? Use the free date API")
agent("Can you read file app.log in this directory and give detailed analysis about INFO, ERROR and WARNINGS occured in log file")


