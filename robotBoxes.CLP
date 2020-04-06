(deffacts datos (robot box 1 piezasMax 8) (boxes box 1 piezas 0 entrega 0 piezasTotales 0 box 2 piezas 2 entrega 1 piezasTotales 2 box 3 piezas 8 entrega 4 piezasTotales 8 box 4 piezas 4 entrega 3 piezasTotales 4 box 5 piezas 0 entrega 0 piezasTotales 0) (piezasRobot piezas 0 entrega 0)
)

(defrule cargarPiezas
?r <- (robot box ?b piezasMax ?max)
?c <- (boxes $?ini box ?b piezas ?p entrega ?e piezasTotales ?x $?fin)
(test (>= (- ?max ?p) 0))
 
=>
(retract ?r ?c)
(assert (robot box ?b piezasMax (- ?max ?p)) (piezasRobot piezas ?p entrega ?e) (boxes ?ini box ?b piezas 0 entrega 0 piezasTotales (- ?x ?p) $?fin))
(printout t "recogidas " ?p " piezas")
)

(defrule soltarPiezas
?piez <- (piezasRobot piezas ?p entrega ?e)
?r <- (robot box ?e piezasMax ?max)
?c <- (boxes $?ini box ?e piezas ?x entrega ?y piezasTotales ?z $?fin)
(test (<= (+ ?max ?p) 8))
=>
(printout t "dejadas " ?p " piezas")
(retract ?piez ?r ?c)
(assert (robot box ?b piezasMax (+ ?max ?p)) (boxes ?ini box ?e piezas (+ ?x ?p) entrega ?y piezasTotales (+ ?z ?z) $?fin))
)

(defrule moverRobotDerecha

 ?r <- (robot box ?b piezasMax ?max)
(test (<= (+ ?b 1) 5))
=>

)




