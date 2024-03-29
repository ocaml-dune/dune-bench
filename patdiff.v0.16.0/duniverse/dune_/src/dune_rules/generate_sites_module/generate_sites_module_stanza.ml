open Import

type t =
  { loc : Loc.t
  ; module_ : Module_name.t
  ; sourceroot : bool
  ; relocatable : bool
  ; sites : (Loc.t * Package.Name.t) list
  ; plugins : (Loc.t * (Package.Name.t * (Loc.t * Site.t))) list
  }

let decode =
  let open Dune_sexp.Decoder in
  fields
    (let+ loc = loc
     and+ module_ = field "module" Module_name.decode
     and+ sourceroot = field_b "sourceroot"
     and+ relocatable = field_b "relocatable"
     and+ sites =
       field "sites" ~default:[] (repeat (located Package.Name.decode))
     and+ plugins =
       field "plugins" ~default:[]
         (repeat (located (pair Package.Name.decode (located Site.decode))))
     in
     { loc; module_; sourceroot; relocatable; sites; plugins })

type Stanza.t += T of t
