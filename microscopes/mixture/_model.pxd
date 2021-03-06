from libcpp cimport bool as cbool
from libcpp.vector cimport vector
from libcpp.utility cimport pair
from libcpp.string cimport string
from libc.stdint cimport uint8_t
from libc.stddef cimport size_t

from microscopes._shared_ptr_h cimport shared_ptr
from microscopes._models_h cimport model as c_component_model
from microscopes.common._typedefs_h cimport (
    hyperparam_bag_t,
    suffstats_bag_t,
)
from microscopes.common._dataview cimport get_c_types, get_np_type
from microscopes.common.recarray._dataview cimport (
    numpy_dataview,
    abstract_dataview,
)
from microscopes.common.recarray._dataview_h cimport (
    row_accessor,
    row_mutator,
    row_major_dataview,
)
from microscopes.common._runtime_type_h cimport runtime_type
from microscopes.common._rng cimport rng
from microscopes.common._entity_state_h cimport (
    entity_based_state_object as c_entity_based_state_object,
)
from microscopes.common._entity_state cimport (
    entity_based_state_object,
)
from microscopes.mixture.definition cimport model_definition

from microscopes.mixture._model_h cimport (
    state as c_state,
    model as c_model,
)
from microscopes.mixture._state_h cimport (
    initialize as c_initialize,
    deserialize as c_deserialize,
)
cimport numpy as np


cdef class state:
    cdef shared_ptr[c_state] _thisptr

    # XXX: the type/structure information below is not technically
    # part of the model, and we should find a way to remove this
    # in the future
    cdef model_definition _defn
