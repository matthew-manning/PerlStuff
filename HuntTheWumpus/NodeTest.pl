#!usr/bin/perl -w
use Node;

my @Nodes;

$Nodes[0] = Node::make('player', 0, $Nodes[1], $Nodes[2], $Nodes[3]);
$Nodes[1] = Node::make('arrow', 1, $Nodes[2], $Nodes[3], $Nodes[0]);
$Nodes[2] = Node::make('', 2, $Nodes[3], $Nodes[0], $Nodes[1]);
$Nodes[3] = Node::make('', 3, $Nodes[0], $Nodes[1], $Nodes[2]);

my $CurNode = $Nodes[0];

print "node id is: ".$CurNode->getId."\n";
print "own contents are: ".$CurNode->ownContents."\n";
print "neighbors' ids are: ".$CurNode->neighborIds."\n";
print "neighbors' contents are: ".$CurNode->neigborContents(1)."\n";

