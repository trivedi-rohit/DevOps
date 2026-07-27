from fastapi import FastAPI
from routers import metrics, aws

app = FastAPI(
    title="Internal DevoOps Utilities API",
    description="This is a internal API utilities app for monitoring metrics of AWS usage.",
    version="1.0.0",
    doc_url="/docs",
    redoc_url="/redoc"
)

@app.get("/")
def hello():
    """ 
    This is a Hello API, for Testing. 
    """
    return{"message":"Hello Python"}

app.include_router(metrics.router)
app.include_router(aws.router, prefix="/aws")
# print(aws)
# print(dir(aws))