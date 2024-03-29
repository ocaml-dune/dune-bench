open! Core
open! Import

module type Mtime = sig
  val mtime : File_name.t -> Time_float.t Or_error.t
end

module type Html_output = sig
  module Private : sig
    module Make (Mtime : Mtime) : Output.S
  end

  module Without_mtime : Output.S
end
