# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionValidation::ValidateApproval;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionValidation::ValidateApproval - Approval for Transition Validation Module

=head1 DESCRIPTION

All ValidateApproval functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $ValidateApprovalObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionValidation::ValidateApproval');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Validate()

    Validate Data

    my $ValidateResult = $ValidateModuleObject->Validate(
        Data       => {
            Queue => 'Raw',
            # ...
        },
    );

    Returns:

    $ValidateResult = 1;        # or undef, only returns 1 if Queue is 'Raw'

    );

=cut

sub Validate {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Data)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # Check if we have Data to check against transitions conditions
    if ( !IsHashRefWithData( $Param{Data} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Data has no values!",
        );
        return;
    }

    $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "-------------------->  $Param{Data}",
    );

    #if ( $Param{Data}->{DynamicField_Status} && $Param{Data}->{DynamicField_Status} eq 'Approval' ) {
    #    return 1;
    #}
    return 1;

    return;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
