open Stdio

module type Result_intf = sig
  type t

  val get : unit -> t
end

module type Arg_intf = sig
  type t

  val v : t
end

module Make_result (Arg : Arg_intf) : Result_intf with type t := Arg.t = struct
  type t = Arg.t

  let get () : t = Arg.v
end

module Arg : Arg_intf with type t = int = struct
  type t = int

  let v = 42
end

module Result = Make_result (Arg)

let a = Result.get () + 3

let () = printf "%d\n" a
