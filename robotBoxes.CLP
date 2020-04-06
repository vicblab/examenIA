(deffacts datos (robot box 1 piezasMax 8) (boxes box 1 piezas 0 entrega 0 box 2 piezas 2 entrega 1 box 3 piezas 8 entrega 4 box 4 piezas 4 entrega 3 box 5 piezas 0 entrega 0) (piezasRobot piezas 0 entrega 0)
)

(defrule cargarPiezas
?r <- (robot box ?b piezasMax ?max)
 ($?ini box ?b piezas ?p entrega ?e)
(test (>= (- ?max ?p) 0))
 
=>
(retract ?r)
(assert (robot box ?b piezasMax (- ?max ?p)) (piezasRobot piezas ?p entrega ?e))

)

(defrule soltarPiezas
(piezasRobot piezas ?p entrega ?e)
(robot box ?e piezasMax ?max)

=>
)
