(* generated by ocamltarzan with: camlp4o -o /tmp/yyy.ml -I pa/ pa_type_conv.cmo pa_vof.cmo  pr_o.cmo /tmp/xxx.ml  *)

open Ast_php_simple
module Ast_php = Meta_ast_php

let rec vof_program v = Ocaml.vof_list vof_stmt v
and vof_wrapped_string (s, tok) =
  Ocaml.VString s
and vof_stmt =
  function
  | Newline -> Ocaml.VSum (("Newline", []))
  | Comment v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("Comment", [ v1 ]))
  | Noop -> Ocaml.VSum (("Noop", []))
  | Expr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Expr", [ v1 ]))
  | Block v1 ->
      let v1 = Ocaml.vof_list vof_stmt v1 in Ocaml.VSum (("Block", [ v1 ]))
  | If ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_stmt v2
      and v3 = vof_stmt v3
      in Ocaml.VSum (("If", [ v1; v2; v3 ]))
  | While ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_stmt v2
      in Ocaml.VSum (("While", [ v1; v2 ]))
  | Do ((v1, v2)) ->
      let v1 = Ocaml.vof_list vof_stmt v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Do", [ v1; v2 ]))
  | For ((v1, v2, v3, v4)) ->
      let v1 = Ocaml.vof_list vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      and v3 = Ocaml.vof_list vof_expr v3
      and v4 = Ocaml.vof_list vof_stmt v4
      in Ocaml.VSum (("For", [ v1; v2; v3; v4 ]))
  | Switch ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_case v2
      in Ocaml.VSum (("Switch", [ v1; v2 ]))
  | Foreach ((v1, v2, v3, v4)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      and v3 = Ocaml.vof_option vof_expr v3
      and v4 = Ocaml.vof_list vof_stmt v4
      in Ocaml.VSum (("Foreach", [ v1; v2; v3; v4 ]))
  | Return v1 ->
      let v1 = Ocaml.vof_option vof_expr v1
      in Ocaml.VSum (("Return", [ v1 ]))
  | Break v1 ->
      let v1 = Ocaml.vof_option vof_expr v1 in Ocaml.VSum (("Break", [ v1 ]))
  | Continue v1 ->
      let v1 = Ocaml.vof_option vof_expr v1
      in Ocaml.VSum (("Continue", [ v1 ]))
  | Throw v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Throw", [ v1 ]))
  | Try ((v1, v2, v3)) ->
      let v1 = Ocaml.vof_list vof_stmt v1
      and v2 = vof_catch v2
      and v3 = Ocaml.vof_list vof_catch v3
      in Ocaml.VSum (("Try", [ v1; v2; v3 ]))
  | InlineHtml v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("InlineHtml", [ v1 ]))
  | StaticVars v1 ->
      let v1 =
        Ocaml.vof_list
          (fun (v1, v2) ->
             let v1 = vof_wrapped_string v1
             and v2 = Ocaml.vof_option vof_expr v2
             in Ocaml.VTuple [ v1; v2 ])
          v1
      in Ocaml.VSum (("StaticVars", [ v1 ]))
  | Global v1 ->
      let v1 = Ocaml.vof_list vof_expr v1 in Ocaml.VSum (("Global", [ v1 ]))
  | ClassDef v1 ->
      let v1 = vof_class_def v1 in Ocaml.VSum (("ClassDef", [ v1 ]))
  | FuncDef v1 ->
      let v1 = vof_func_def v1 in Ocaml.VSum (("FuncDef", [ v1 ]))
and vof_case =
  function
  | Case ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_stmt v2
      in Ocaml.VSum (("Case", [ v1; v2 ]))
  | Default v1 ->
      let v1 = Ocaml.vof_list vof_stmt v1 in Ocaml.VSum (("Default", [ v1 ]))
and vof_catch (v1, v2, v3) =
  let v1 = Ocaml.vof_string v1
  and v2 = Ocaml.vof_string v2
  and v3 = Ocaml.vof_list vof_stmt v3
  in Ocaml.VTuple [ v1; v2; v3 ]
and vof_expr =
  function
  | Int v1 -> let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("Int", [ v1 ]))
  | Double v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("Double", [ v1 ]))
  | String v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("String", [ v1 ]))
  | Guil v1 ->
      let v1 = Ocaml.vof_list vof_encaps v1 in Ocaml.VSum (("Guil", [ v1 ]))
  | HereDoc ((v1, v2, v3)) ->
      let v1 = Ocaml.vof_string v1
      and v2 = Ocaml.vof_list vof_encaps v2
      and v3 = Ocaml.vof_string v3
      in Ocaml.VSum (("HereDoc", [ v1; v2; v3 ]))
  | Id v1 -> 
      let v1 = vof_wrapped_string v1 in Ocaml.VSum (("Id", [ v1 ]))
  | This -> Ocaml.VSum (("This", []))
  | Array_get ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_option vof_expr v2
      in Ocaml.VSum (("Array_get", [ v1; v2 ]))
  | Obj_get ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Obj_get", [ v1; v2 ]))
  | Class_get ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Class_get", [ v1; v2 ]))
  | Assign ((v1, v2, v3)) ->
      let v1 = Ocaml.vof_option Ast_php.vof_binaryOp v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("Assign", [ v1; v2; v3 ]))
  | Infix ((v1, v2)) ->
      let v1 = Ast_php.vof_fixOp v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Infix", [ v1; v2 ]))
  | Postfix ((v1, v2)) ->
      let v1 = Ast_php.vof_fixOp v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Postfix", [ v1; v2 ]))
  | Binop ((v1, v2, v3)) ->
      let v1 = Ast_php.vof_binaryOp v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("Binop", [ v1; v2; v3 ]))
  | Unop ((v1, v2)) ->
      let v1 = Ast_php.vof_unaryOp v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Unop", [ v1; v2 ]))
  | Call ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      in Ocaml.VSum (("Call", [ v1; v2 ]))
  | Ref v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Ref", [ v1 ]))
  | Xhp v1 -> let v1 = vof_xml v1 in Ocaml.VSum (("Xhp", [ v1 ]))
  | ConsArray v1 ->
      let v1 = Ocaml.vof_list vof_array_value v1
      in Ocaml.VSum (("ConsArray", [ v1 ]))
  | List v1 ->
      let v1 = Ocaml.vof_list vof_expr v1 in Ocaml.VSum (("List", [ v1 ]))
  | New ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      in Ocaml.VSum (("New", [ v1; v2 ]))
  | InstanceOf ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("InstanceOf", [ v1; v2 ]))
  | CondExpr ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("CondExpr", [ v1; v2; v3 ]))
  | Cast ((v1, v2)) ->
      let v1 = Ast_php.vof_ptype v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Cast", [ v1; v2 ]))
  | Lambda v1 -> let v1 = vof_func_def v1 in Ocaml.VSum (("Lambda", [ v1 ]))
and vof_array_value =
  function
  | Aval v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Aval", [ v1 ]))
  | Akval ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Akval", [ v1; v2 ]))
and vof_encaps =
  function
  | EncapsString v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("EncapsString", [ v1 ]))
  | EncapsVar v1 ->
      let v1 = vof_expr v1 in Ocaml.VSum (("EncapsVar", [ v1 ]))
  | EncapsCurly v1 ->
      let v1 = vof_expr v1 in Ocaml.VSum (("EncapsCurly", [ v1 ]))
  | EncapsDollarCurly v1 ->
      let v1 = vof_expr v1 in Ocaml.VSum (("EncapsDollarCurly", [ v1 ]))
  | EncapsExpr v1 ->
      let v1 = vof_expr v1 in Ocaml.VSum (("EncapsExpr", [ v1 ]))
and vof_xhp =
  function
  | XhpText v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("XhpText", [ v1 ]))
  | XhpExpr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("XhpExpr", [ v1 ]))
  | XhpXml v1 -> let v1 = vof_xml v1 in Ocaml.VSum (("XhpXml", [ v1 ]))
and
  vof_xml {
            xml_tag = v_xml_tag;
            xml_attrs = v_xml_attrs;
            xml_body = v_xml_body
          } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_xhp v_xml_body in
  let bnd = ("xml_body", arg) in
  let bnds = bnd :: bnds in
  let arg =
    Ocaml.vof_list
      (fun (v1, v2) ->
         let v1 = Ocaml.vof_string v1
         and v2 = vof_xhp_attr v2
         in Ocaml.VTuple [ v1; v2 ])
      v_xml_attrs in
  let bnd = ("xml_attrs", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list Ocaml.vof_string v_xml_tag in
  let bnd = ("xml_tag", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_xhp_attr =
  function
  | AttrString v1 ->
      let v1 = Ocaml.vof_list vof_encaps v1
      in Ocaml.VSum (("AttrString", [ v1 ]))
  | AttrExpr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("AttrExpr", [ v1 ]))
and
  vof_func_def {
                 f_ref = v_f_ref;
                 f_name = v_f_name;
                 f_params = v_f_params;
                 f_return_type = v_f_return_type;
                 f_body = v_f_body
               } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_stmt v_f_body in
  let bnd = ("f_body", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_f_return_type in
  let bnd = ("f_return_type", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_parameter v_f_params in
  let bnd = ("f_params", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_f_ref in
  let bnd = ("f_ref", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_f_name in
  let bnd = ("f_name", arg) in
  let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and
  vof_parameter {
                  p_type = v_p_type;
                  p_ref = v_p_ref;
                  p_name = v_p_name;
                  p_default = v_p_default
                } =
  let bnds = [] in
  let arg = Ocaml.vof_option vof_expr v_p_default in
  let bnd = ("p_default", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_p_name in
  let bnd = ("p_name", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_p_ref in
  let bnd = ("p_ref", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_p_type in
  let bnd = ("p_type", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_hint_type =
  function
  | Hint v1 -> let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("Hint", [ v1 ]))
  | HintArray -> Ocaml.VSum (("HintArray", []))
and
  vof_class_def {
                  c_type = v_c_type;
                  c_name = v_c_name;
                  c_extends = v_c_extends;
                  c_implements = v_c_implements;
                  c_constants = v_c_constants;
                  c_variables = v_c_variables;
                  c_body = v_c_body
                } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_method_def v_c_body in
  let bnd = ("c_body", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_class_vars v_c_variables in
  let bnd = ("c_variables", arg) in
  let bnds = bnd :: bnds in
  let arg =
    Ocaml.vof_list
      (fun (v1, v2) ->
         let v1 = Ocaml.vof_string v1
         and v2 = vof_expr v2
         in Ocaml.VTuple [ v1; v2 ])
      v_c_constants in
  let bnd = ("c_constants", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list Ocaml.vof_string v_c_implements in
  let bnd = ("c_implements", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list Ocaml.vof_string v_c_extends in
  let bnd = ("c_extends", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_class_type v_c_type in
  let bnd = ("c_type", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_c_name in
  let bnd = ("c_name", arg) in
  let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and vof_class_type =
  function
  | ClassRegular -> Ocaml.VSum (("ClassRegular", []))
  | ClassFinal -> Ocaml.VSum (("ClassFinal", []))
  | ClassAbstract -> Ocaml.VSum (("ClassAbstract", []))
  | Interface -> Ocaml.VSum (("Interface", []))
  | Trait -> Ocaml.VSum (("Trait", []))
and
  vof_class_vars {
                   cv_final = v_cv_final;
                   cv_static = v_cv_static;
                   cv_abstract = v_cv_abstract;
                   cv_visibility = v_cv_visibility;
                   cv_type = v_cv_type;
                   cv_vars = v_cv_vars
                 } =
  let bnds = [] in
  let arg =
    Ocaml.vof_list
      (fun (v1, v2) ->
         let v1 = Ocaml.vof_string v1
         and v2 = Ocaml.vof_option vof_expr v2
         in Ocaml.VTuple [ v1; v2 ])
      v_cv_vars in
  let bnd = ("cv_vars", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_cv_type in
  let bnd = ("cv_type", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_visibility v_cv_visibility in
  let bnd = ("cv_visibility", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_cv_abstract in
  let bnd = ("cv_abstract", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_cv_static in
  let bnd = ("cv_static", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_cv_final in
  let bnd = ("cv_final", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and
  vof_method_def {
                   m_visibility = v_m_visibility;
                   m_static = v_m_static;
                   m_final = v_m_final;
                   m_abstract = v_m_abstract;
                   m_ref = v_m_ref;
                   m_name = v_m_name;
                   m_params = v_m_params;
                   m_return_type = v_m_return_type;
                   m_body = v_m_body
                 } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_stmt v_m_body in
  let bnd = ("m_body", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_m_return_type in
  let bnd = ("m_return_type", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_parameter v_m_params in
  let bnd = ("m_params", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_m_ref in
  let bnd = ("m_ref", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_m_abstract in
  let bnd = ("m_abstract", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_m_final in
  let bnd = ("m_final", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_m_static in
  let bnd = ("m_static", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_visibility v_m_visibility in
  let bnd = ("m_visibility", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_m_name in
  let bnd = ("m_name", arg) in
  let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and vof_visibility =
  function
  | Novis -> Ocaml.VSum (("Novis", []))
  | Public -> Ocaml.VSum (("Public", []))
  | Private -> Ocaml.VSum (("Private", []))
  | Protected -> Ocaml.VSum (("Protected", []))
  | Abstract -> Ocaml.VSum (("Abstract", []))

