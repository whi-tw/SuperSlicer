package Slic3r::Point;
use strict;
use warnings;

sub new {
    my $class = shift;
    my $self;
    if (@_ == 2) {
        $self = [@_];
    } elsif ((ref $_[0]) =~ 'ARRAY' || (ref $_[0]) =~ /Slic3r::Point/) {
        $self = [@{$_[0]}];
    } elsif ($_[0]->isa(__PACKAGE__)) {
        return $_[0];
    } else {
        use XXX;
        ZZZ \@_;
        die "Invalid arguments for ${class}->new";
    }
    bless $self, $class;
    return $self;
}

sub clone {
    my $self = shift;
    return (ref $self)->new(@$self);
}

sub cast {
    my $class = shift;
    if (ref $_[0] eq 'Slic3r::Point') {
        return $_[0];
    } else {
        return $class->new(@_);
    }
}

sub id {
    my $self = shift;
    return join ',', @$self;
}

sub coordinates {
    my $self = shift;
    return @$self;
}

sub coincides_with {
    my $self = shift;
    my ($point) = @_;
    return Slic3r::Geometry::points_coincide($self, $point);
}

sub distance_to {
    my $self = shift;
    my ($point) = @_;
    return Slic3r::Geometry::distance_between_points($self, $point);
}

sub x { $_[0]->[0] }
sub y { $_[0]->[1] }

1;
