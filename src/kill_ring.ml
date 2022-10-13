open! Core
open! Async_kernel
open! Import

let kill_ring = Var.Wrap.("kill-ring" <: list Text.t)
let kill_ring_as_value = Var.create kill_ring.symbol Value.Type.value
let is_empty () = Value.is_nil (Current_buffer.value_exn kill_ring_as_value)
let kill_new = Funcall.Wrap.("kill-new" <: Text.t @-> return nil)
let current_kill = Funcall.Wrap.("current-kill" <: int @-> bool @-> return Text.t)
let current_kill_exn () = current_kill 0 false
