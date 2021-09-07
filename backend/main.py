from fastapi import FastAPI

app = FastAPI()


@app.on_event("startup")
async def startup() -> None:
    """Event handler running at startup."""
    pass


@app.on_event("shutdown")
async def shutdown() -> None:
    """Event handler running at shutdown."""
    pass
