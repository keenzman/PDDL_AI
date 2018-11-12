(define (problem DisasterRobotProblem2)
        (:domain DisasterRobot)

        (:objects
			Robo1 Robo2 Robo3 - robot
			p1 p2 p3 p4 p5 - person
			a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 - location
			Puddle1 Puddle2 Pillar1 Pillar2 Wall1 Wall2 Wall3 Rubble1 Rubble2 Rubble3 - obstacle
        )

        (:init
                    (at Robo1 a1)
						(notBusy Robo1)
						
					(at Robo2 a10)
						(notBusy Robo2)
						
					(at Robo3 a24)
						(notBusy Robo3)

                    (at p1 a4)
						(clear a4)
						(noInjection p1)
						(needsMark p1)
						(notBeingInteractedWith p1)

        		    (at p2 a11)
						(clear a11) 
						(needsMark p2)
						(notBeingInteractedWith p2)

                    (at p3 a18)
						(clear a18)
						(noInjection p3)
						(needsMark p3)
						(notBeingInteractedWith p3)

        		    (at p4 a22)
						(clear a22) 
						(needsMark p4)
						(notBeingInteractedWith p4)

                    (at p5 a15)
						(clear a15)
						(noInjection p5)
						(needsMark p5)
						(notBeingInteractedWith p5)

        		(at Puddle1 a5)
        		        (canGoThrough Puddle1)
        	            (notBeingInteractedWith Puddle1)

        		(at Puddle2 a12)
                        (canGoThrough Puddle2)
                        (notBeingInteractedWith Puddle2)

                (at Wall1 a6)
                        (canDrillThrough Wall1)
                        (notBeingInteractedWith Wall1)
						(notLoadBearing Wall1)

                (at Wall2 a9)
                        (canDrillThrough Wall2)
                        (notBeingInteractedWith Wall2)
						(notLoadBearing Wall2)

                (at Wall3 a23)
                        (canDrillThrough Wall3)
                        (notBeingInteractedWith Wall3)
						(notLoadBearing Wall3)

                (at Pillar1 a7)
						(canGoAround Pillar1)
                        (notBeingInteractedWith Pillar1)

                (at Pillar2 a19)
                        (canGoAround Pillar2)
                        (notBeingInteractedWith Pillar2)

        		(at Rubble1 a3)
						(canBePushed Rubble1)
						(notBeingInteractedWith Rubble1)
						(notLoadBearing Rubble1)

        		(at Rubble2 a17)
                        (canBePushed Rubble2)
                        (notBeingInteractedWith Rubble2)
						(notLoadBearing Rubble1)

                (at Rubble3 a14)
                        (canGoOver Rubble3)
                        (notBeingInteractedWith Rubble3)
						(notLoadBearing Rubble1)

							(clear a1)
							(adjacent a1 a2)
							(adjacent a1 a6)

							(clear a2)
							(adjacent a2 a1)
							(adjacent a2 a3)
							(adjacent a2 a7)

							(not(clear a3))
							(adjacent a3 a2)
							(adjacent a3 a4)
							(adjacent a3 a8)

							(clear a4)
							(adjacent a4 a3)
							(adjacent a4 a5)
							(adjacent a4 a9)

							(not(clear a5))
							(adjacent a5 a4)
							(adjacent a5 a10)

							(not(clear a6))
							(adjacent a6 a7)
							(adjacent a6 a1)
							(adjacent a6 a11)

							(not(clear a7))
							(adjacent a7 a6)
							(adjacent a7 a8)
							(adjacent a7 a2)
							(adjacent a7 a12)

							(clear a8)
							(adjacent a8 a7)
							(adjacent a8 a9)
							(adjacent a8 a3)
							(adjacent a8 a13)

							(not(clear a9))
							(adjacent a9 a8)
							(adjacent a9 a10)
							(adjacent a9 a4)
							(adjacent a9 a14)

							(clear a10)
							(adjacent a10 a9)
							(adjacent a10 a5)
							(adjacent a10 a15)

							(clear a11)
							(adjacent a11 a12)
							(adjacent a11 a6)
							(adjacent a11 a16)

							(not(clear a12))
							(adjacent a12 a11)
							(adjacent a12 a13)
							(adjacent a12 a7)
							(adjacent a12 a17)

							(clear a13)
							(adjacent a13 a12)
							(adjacent a13 a14)
							(adjacent a13 a8)
							(adjacent a13 a18)

							(not(clear a14))
							(adjacent a14 a13)
							(adjacent a14 a15)
							(adjacent a14 a9)
							(adjacent a14 a19)

							(clear a15)
							(adjacent a15 a14)
							(adjacent a15 a10)
							(adjacent a15 a20)

							(clear a16)
							(adjacent a16 a17)
							(adjacent a16 a11)
							(adjacent a16 a21)

							(not(clear a17))
							(adjacent a17 a16)
							(adjacent a17 a18)
							(adjacent a17 a12)
							(adjacent a17 a22)

							(clear a18)
							(adjacent a18 a17)
							(adjacent a18 a19)
							(adjacent a18 a13)
							(adjacent a18 a23)

							(not(clear a19))
							(adjacent a19 a18)
							(adjacent a19 a20)
							(adjacent a19 a14)
							(adjacent a19 a24)

							(clear a20)
							(adjacent a20 a19)
							(adjacent a20 a15)
							(adjacent a20 a25)

							(clear a21)
							(adjacent a21 a22)
							(adjacent a21 a16)

							(clear a22)
							(adjacent a22 a21)
							(adjacent a22 a23)
							(adjacent a22 a17)

							(not(clear a23))
							(adjacent a23 a22)
							(adjacent a23 a24)
							(adjacent a23 a18)

							(clear a24)
							(adjacent a24 a23)
							(adjacent a24 a25)
							(adjacent a24 a19)

							(clear a25)
							(adjacent a25 a24)
							(adjacent a25 a20)             				
													
													
							(= (normalMove Robo1) 4)
							(= (injectionTime) 6)
							(= (markTime) 2)
							
							(= (normalMove Robo2) 4)
							(= (injectionTime) 6)
							(= (markTime) 2)
							
							(= (normalMove Robo3) 4)
							(= (injectionTime) 6)
							(= (markTime) 2)
						
							(= (goIntoTime Puddle1) 3)
							(= (goIntoTime Puddle2) 5)

							(= (goAroundTime Pillar1) 6)
							(= (goAroundTime Pillar2) 8)

							(= (drillTime Wall1) 10)
							(= (drillTime Wall3) 10)
							(= (drillTime Wall2) 12)

							(= (pushTime Rubble1) 6)
							(= (pushTime Rubble2) 6)
							(= (pushTime Rubble3) 8)

                        )

                              (:goal (and (marked p1)
                                          (marked p2)
                                          (marked p3)
                                          (marked p4)
                                          (marked p5)))
)



