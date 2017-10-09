(* ::Package:: *)

BeginPackage["CelestialMechanics`"]
\[CapitalDelta]v1::usage=
"Calculates the delta-v for the exit burn of
a Hohmann transfer from r1 to r2 where \[Mu] is the
standard gravitational parameter."
\[CapitalDelta]v2::usage=
"Calculates the delta-v for the capture burn of
a Hohmann transfer from r1 to r2where \[Mu] is the
standard gravitational parameter."
\[CapitalDelta]v::usage=
"Calculates the total delta-v necessary for the complete
Hohmann transfer from r1 to r2."
th::usage=
"Calculates the time to transfer between orbits r1 and r2
where \[Mu] is the standard gravitational parameter."
\[Omega]2::usage=
"Target angular velocity for planet-to-planet transfer
where \[Mu] is the standard gravitational parameter
and r2 is the target orbit radius."
\[Alpha]::usage=
"angular alignment in radians at the time of start between
the source object and the target object."
c::usage=
"Calculate the k-th Stumpff equation."

Begin["`Private`"]

\[CapitalDelta]v1[\[Mu]_,r1_,r2_] := N[Sqrt[\[Mu]/r1](Sqrt[2 r2/(r1 + r2)]-1)]
\[CapitalDelta]v2[\[Mu]_,r1_,r2_] := N[Sqrt[\[Mu]/r2](Sqrt[2 r1/(r1 + r2)]-1)]
\[CapitalDelta]v[\[Mu]_,r1_,r2_] := \[CapitalDelta]v1[\[Mu],r1,r2] + \[CapitalDelta]v2[\[Mu],r1,r2]
th[\[Mu]_,r1_,r2_] := N[\[Pi] Sqrt[(r1 + r2)^3/(8\[Mu])]]
\[Omega]2[\[Mu]_,r2_] := N[Sqrt[\[Mu]/r2^3]]
\[Alpha][\[Mu]_,r1_,r2_] := N[\[Pi] - \[Omega]2[\[Mu],r2] th[\[Mu],r1,r2]]
Subscript[c, k_][x_]:=Sum[((-1)^i x^i)/(k+2i)!,{i,0,\[Infinity]}]

End[]
EndPackage[]
