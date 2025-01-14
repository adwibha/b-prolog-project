% Rule Specification: rule(ID, LowerSrc, UpperSrc, LowerDst, UpperDst, Protocol, Action)

% Given Input Rules
rule(1, 10, 20, 30, 40, tcp, accept).
rule(2, 10, 10, 30, 30, tcp, deny).
rule(3, 10, 10, 30, 30, udp, accept).
rule(4, 10, 15, 20, 25, tcp, accept).
rule(5, 50, 60, 70, 80, tcp, deny).

% Checking the two rules conflicting conditions
checking_rules_conflict(Rl, R2) :-
    rule(Rl, LwrSrc1, UprSrc1, LwrDst1, UprDst1, Prtcl1, Actn1),
    rule(R2, LwrSrc2, UprSrc2, LwrDst2, UprDst2, Prtcl2, Actn2),
    subnet_condition_conflict(LwrSrc1, UprSrc1, LwrSrc2, UprSrc2),
    subnet_condition_conflict(LwrDst1, UprDst1, LwrDst2, UprDst2),
    Prtcl1 = Prtcl2,
    Actn1 \= Actn2,
    action_condition_conflict(Rl, R2).

% Checking the action condition for overlapping Rules
action_condition_conflict(R1, R2) :-
    rule(R1, LwrSrc1, UprSrc1, LwrDst1, UprDst1, Prtcl1, Actn1),
    rule(R2, LwrSrc2, UprSrc2, LwrDst2, UprDst2, Prtcl2, Actn2),
    between(LwrSrc1, UprSrc1, Src),
    between(LwrDst1, UprDst1, Dst),
    Protocol = Prtcl1,
    (Protocol = tcp -> Action1 = Actn1; Protocol = udp -> Action1 = Actn1),
    (Protocol = Prtcl2 -> (Protocol = tcp -> Action2 = Actn2; Protocol = udp -> Action2 = Actn2)),
    Src >= LwrSrc2, Src =< UprSrc2, Dst >= LwrDst2, Dst =< UprDst2,
    Action1 \= Action2.

% Checking subnet conflicts for the rules
subnet_condition_conflict(Lwr1, Upr1, Lwr2, Upr2) :-
    ((Lwr1 =< Upr2, Upr1 >= Lwr2) ; (Lwr2 =< Upr1, Upr2 >= Lwr1)).

% Comparing the Rules to check for conflicts
rules_cmp_conflicts :-
    findall([Rl1, Rl2], (rule(Rl1, _, _, _, _, _, _), rule(Rl2, _, _, _, _, _, _), Rl1 < Rl2, checking_rules_conflict(Rl1, Rl2)), AllPairs),
    sort(AllPairs, UniquePairs),
    display_conflicting_rules(UniquePairs).

display_conflicting_rules([]).
display_conflicting_rules([[Rl1, Rl2] | Rest]) :-
    not(conflict_display(Rl1, Rl2)),
    assert(conflict_display(Rl1, Rl2)),
    write(Rl1), write(' and '), write(Rl2), write(' rules are conflicting.'), nl,
    display_conflicting_rules(Rest).
display_conflicting_rules([_ | Rest]) :-
    display_conflicting_rules(Rest).

:- dynamic conflict_display/2.