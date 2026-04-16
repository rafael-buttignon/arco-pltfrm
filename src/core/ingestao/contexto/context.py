import ast
import os
import warnings
from abc import abstractmethod
from datetime import datetime, timedelta
from typing import Any, Dict, List, Optional, Union

class Context(object):
    def __init__(
        self,
        dag_id: Union[str, None],
        escopo: Union[str, None],
        dominio: Union[str, None],
        connector: Union[str, None],
        agendamento: Union[str, None],
        dag_name: Union[str, None],
        source_system: Union[str, None],
        source_entity: Union[str, None],
        observabilidade: Union[Dict[str, Any], None],
        owner_team: Union[list, str],
        credencial_id: Union[str, None],
        opcoes: Optional[Dict] = None,
        transformacoes: Optional[Dict[str, Any]] = None,
        sync: Optional[Dict] = None,
        acl: Optional[Dict] = None,
        formato: Optional[str] = None,
        base_path: Optional[str] = None,
        qualidade: Optional[Dict] = None,
        notificacao: Optional[Dict] = None,
    ):
        self.dag_id = dag_id
        self.escopo = escopo or ScopeType.INGESTION.value
        self.dominio = dominio
        self.connector = connector
        self.agendamento = agendamento
        self.credencial_id = credencial_id
        self.source_system = source_system
        self.source_entity = source_entity
        self.notificacao: List[str] = notificacao or []
        self.dag_name = dag_name
        self.owner_team = owner_team
        self.base_path = base_path
        self.acl = acl
        self.sync = sync
        self.transformacoes = transformacoes
        self.observabilidade = observabilidade or {}
        self.formato = formato
        self.opcoes = opcoes or {}
        self.qualidade = qualidade

    @property
    def observabilidade(self):
        pass

    @observabilidade.setter
    def observabilidade(self, value: Dict[str, Any]):
        self._observabilidade = value

    @staticmethod
    @abstractmethod
    def build(context: dict):
        pass