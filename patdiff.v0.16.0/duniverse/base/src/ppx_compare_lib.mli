(** Runtime support for auto-generated comparators.  Users are not intended to use this
    module directly. *)

type 'a compare = 'a -> 'a -> int
type 'a equal = 'a -> 'a -> bool

(** Raise when fully applied *)
val compare_abstract : type_name:string -> _ compare

val equal_abstract : type_name:string -> _ equal

module Comparable : sig
  module type S = sig
    type t

    val compare : t compare
  end

  module type S1 = sig
    type 'a t

    val compare : 'a compare -> 'a t compare
  end

  module type S2 = sig
    type ('a, 'b) t

    val compare : 'a compare -> 'b compare -> ('a, 'b) t compare
  end

  module type S3 = sig
    type ('a, 'b, 'c) t

    val compare : 'a compare -> 'b compare -> 'c compare -> ('a, 'b, 'c) t compare
  end
end

module Equal : sig
  module type S = sig
    type t

    val equal : t equal
  end

  module type S1 = sig
    type 'a t

    val equal : 'a equal -> 'a t equal
  end

  module type S2 = sig
    type ('a, 'b) t

    val equal : 'a equal -> 'b equal -> ('a, 'b) t equal
  end

  module type S3 = sig
    type ('a, 'b, 'c) t

    val equal : 'a equal -> 'b equal -> 'c equal -> ('a, 'b, 'c) t equal
  end
end

module Builtin : sig
  val compare_bool : bool compare
  val compare_char : char compare
  val compare_float : float compare
  val compare_int : int compare
  val compare_int32 : int32 compare
  val compare_int64 : int64 compare
  val compare_nativeint : nativeint compare
  val compare_string : string compare
  val compare_unit : unit compare
  val compare_array : 'a compare -> 'a array compare
  val compare_list : 'a compare -> 'a list compare
  val compare_option : 'a compare -> 'a option compare
  val compare_ref : 'a compare -> 'a ref compare
  val equal_bool : bool equal
  val equal_char : char equal
  val equal_float : float equal
  val equal_int : int equal
  val equal_int32 : int32 equal
  val equal_int64 : int64 equal
  val equal_nativeint : nativeint equal
  val equal_string : string equal
  val equal_unit : unit equal
  val equal_array : 'a equal -> 'a array equal
  val equal_list : 'a equal -> 'a list equal
  val equal_option : 'a equal -> 'a option equal
  val equal_ref : 'a equal -> 'a ref equal
end
