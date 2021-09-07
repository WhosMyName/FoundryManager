"""Base Controller for simpler DB interactions."""

# from typing import Type

from sqlalchemy import Table

# import database
# import DeclarativeBase


class BaseController:
    _table: Table
    _Model = None
    _database = None

    def __init__(self, model) -> None:
        pass
        # self._Model = model
        # self._table = model.__table__
        # self._database = None
