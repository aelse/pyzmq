"""0MQ Socket class declaration."""

#
#    Copyright (c) 2010-2011 Brian E. Granger & Min Ragan-Kelley
#
#    This file is part of pyzmq.
#
#    pyzmq is free software; you can redistribute it and/or modify it under
#    the terms of the Lesser GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    pyzmq is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    Lesser GNU General Public License for more details.
#
#    You should have received a copy of the Lesser GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#-----------------------------------------------------------------------------
# Imports
#-----------------------------------------------------------------------------

from context cimport Context

#-----------------------------------------------------------------------------
# Code
#-----------------------------------------------------------------------------


cdef class Socket:
    """A 0MQ socket."""

    cdef void *handle           # The C handle for the underlying zmq object.
    cdef public int socket_type # The 0MQ socket type - REQ,REP, etc.
    # Hold on to a reference to the context to make sure it is not garbage
    # collected until the socket it done with it.
    cdef public Context context # The zmq Context object that owns this.
    cdef public bint _closed   # bool property for a closed socket.
    cdef dict _attrs   # dict needed for *non-sockopt* get/setattr in subclasses

    # cpdef methods for direct-cython access:
    cpdef object send(self, object data, int flags=*, copy=*, track=*)
    cpdef object recv(self, int flags=*, copy=*, track=*)

