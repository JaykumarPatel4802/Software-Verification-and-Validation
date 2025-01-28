-- the one here forces every example generated to have only 1 list
-- but it alone isn't sufficient, can have disconnected nodes that aren't in a list
one sig List{
	header: lone Node -- header: List x Node; the "lone" qualifier allows header to not be there
}

sig Node{
	-- by default, without "lone", it will require every Node to have a next Node
	link: lone Node -- link: Node x Node
}

pred Acyclic(l: List) {
	all n: l.header.*link | n !in n.^link -- * is reflexive transitive closure (0+); ^ is 1+
}

-- this fails on an empty lists. There [does NOT] exist a node that has a null link. 
pred Acyclic2(l: List) {
	some n: l.header.*link | no n.link -- there is some node, n, such that there is no n.list (null terminated)
}

check {
	-- all l:List | Acyclic[l] <=> Acyclic2[l] -- checks for equivalence. for any list, if it satisfies one definition, it satisfies th other

	-- the following gives "assertion MAY be valid", it says MAY because its true for the size bounds we set
	all l:List | Acyclic[l] <=> Acyclic3[l] -- checks for equivalence. for any list, if it satisfies one definition, it satisfies th other
}

-- fix Acyclic2 (by allowing empty lists)
pred Acyclic3(l: List) {
	no l.header or some n: l.header.*link | no n.link -- either we have no header, or there is a node with null link
}

-- this will require every node to be in some list
-- The set of all nodes in a list = set of all nodes, i.e. nodes have to be in a list?
-- fact { List.header.*link = Node }

run Acyclic
-- default upper bound is 3, but can chance the quantity of elements as below
-- run Acyclic for 1 List, 3 Node --if we do this, we can remove the "one" in front of "sig List" earlier
