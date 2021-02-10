need    Hypervisor::IBM::POWER::HMC::REST::Atom;
need    Hypervisor::IBM::POWER::HMC::REST::Config;
need    Hypervisor::IBM::POWER::HMC::REST::Config::Analyze;
need    Hypervisor::IBM::POWER::HMC::REST::Config::Dump;
need    Hypervisor::IBM::POWER::HMC::REST::Config::Optimize;
use     Hypervisor::IBM::POWER::HMC::REST::Config::Traits;
need    Hypervisor::IBM::POWER::HMC::REST::ETL::XML;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionCapabilities;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionIOConfiguration;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionMemoryConfiguration;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::HostEthernetAdapterLogicalPorts;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::HardwareAcceleratorQoS;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::BootListInformation;
use     URI;
unit    class Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition:api<1>:auth<Mark Devine (mark@markdevine.com)>
            does Hypervisor::IBM::POWER::HMC::REST::Config::Analyze
            does Hypervisor::IBM::POWER::HMC::REST::Config::Dump
            does Hypervisor::IBM::POWER::HMC::REST::Config::Optimize
            does Hypervisor::IBM::POWER::HMC::REST::ETL::XML;

my      Bool                                                                                                                                    $names-checked  = False;
my      Bool                                                                                                                                    $analyzed       = False;
my      Lock                                                                                                                                    $lock           = Lock.new;
has     Hypervisor::IBM::POWER::HMC::REST::Config                                                                                               $.config        is required;
has     Bool                                                                                                                                    $.initialized   = False;
has     Hypervisor::IBM::POWER::HMC::REST::Atom                                                                                                 $.atom                                  is conditional-initialization-attribute;
has     Str                                                                                                                                     $.id;
has     DateTime                                                                                                                                $.published                             is conditional-initialization-attribute;
has     Str                                                                                                                                     $.AllowPerformanceDataCollection        is conditional-initialization-attribute;
has     URI                                                                                                                                     $.AssociatedPartitionProfile            is conditional-initialization-attribute;
has     Str                                                                                                                                     $.AvailabilityPriority                  is conditional-initialization-attribute;
has     Str                                                                                                                                     $.CurrentProcessorCompatibilityMode     is conditional-initialization-attribute;
has     Str                                                                                                                                     $.CurrentProfileSync                    is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsBootable                            is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsConnectionMonitoringEnabled         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsOperationInProgress                 is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsRedundantErrorPathReportingEnabled  is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsTimeReferencePartition              is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsVirtualServiceAttentionLEDOn        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsVirtualTrustedPlatformModuleEnabled is conditional-initialization-attribute;
has     Str                                                                                                                                     $.KeylockPosition                       is conditional-initialization-attribute;
has     Str                                                                                                                                     $.LogicalSerialNumber                   is conditional-initialization-attribute;
has     Str                                                                                                                                     $.OperatingSystemVersion                is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionCapabilities            $.PartitionCapabilities                 is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PartitionID                           is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionIOConfiguration         $.PartitionIOConfiguration              is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionMemoryConfiguration     $.PartitionMemoryConfiguration          is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PartitionName;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration  $.PartitionProcessorConfiguration       is conditional-initialization-attribute;
has     URI                                                                                                                                     @.PartitionProfiles                     is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PartitionState                        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PartitionType                         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PartitionUUID                         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PendingProcessorCompatibilityMode     is conditional-initialization-attribute;
has     URI                                                                                                                                     $.ProcessorPool                         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.ProgressPartitionDataRemaining        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.ProgressPartitionDataTotal            is conditional-initialization-attribute;
has     Str                                                                                                                                     $.ProgressState                         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.ResourceMonitoringControlState        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.ResourceMonitoringIPAddress           is conditional-initialization-attribute;
has     URI                                                                                                                                     $.AssociatedManagedSystem               is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::HostEthernetAdapterLogicalPorts  $.HostEthernetAdapterLogicalPorts       is conditional-initialization-attribute;
has     Str                                                                                                                                     $.MACAddressPrefix                      is conditional-initialization-attribute;
has     Str                                                                                                                                     $.IsServicePartition                    is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PowerVMManagementCapable              is conditional-initialization-attribute;
has     Str                                                                                                                                     $.ReferenceCode                         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.AssignAllResources                    is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::HardwareAcceleratorQoS           $.HardwareAcceleratorQoS                is conditional-initialization-attribute;
has     Str                                                                                                                                     $.LastActivatedProfile                  is conditional-initialization-attribute;
has     Str                                                                                                                                     $.HasPhysicalIO                         is conditional-initialization-attribute;
has     Str                                                                                                                                     $.OperatingSystemType                   is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PendingSecureBoot                     is conditional-initialization-attribute;
has     Str                                                                                                                                     $.CurrentSecureBoot                     is conditional-initialization-attribute;
has     Str                                                                                                                                     $.BootMode                              is conditional-initialization-attribute;
has     Str                                                                                                                                     $.PowerOnWithHypervisor                 is conditional-initialization-attribute;
has     Str                                                                                                                                     $.Description                           is conditional-initialization-attribute;
has     Str                                                                                                                                     $.MigrationStorageViosDataStatus        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.MigrationStorageViosDataTimestamp     is conditional-initialization-attribute;
has     Str                                                                                                                                     $.RemoteRestartCapable                  is conditional-initialization-attribute;
has     Str                                                                                                                                     $.SimplifiedRemoteRestartCapable        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.HasDedicatedProcessorsForMigration    is conditional-initialization-attribute;
has     Str                                                                                                                                     $.SuspendCapable                        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.MigrationDisable                      is conditional-initialization-attribute;
has     Str                                                                                                                                     $.MigrationState                        is conditional-initialization-attribute;
has     Str                                                                                                                                     $.RemoteRestartState                    is conditional-initialization-attribute;
has     URI                                                                                                                                     @.VirtualFibreChannelClientAdapters     is conditional-initialization-attribute;
has     URI                                                                                                                                     @.DedicatedVirtualNICs                  is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::BootListInformation              $.BootListInformation                   is conditional-initialization-attribute;

method  xml-name-exceptions () { return set <Metadata>; }

submethod TWEAK {
    self.config.diag.post:      self.^name ~ '::' ~ &?ROUTINE.name if %*ENV<HIPH_SUBMETHOD>;
    self.config.diag.post:      sprintf("%-20s %10s: %11s", self.^name.subst(/^.+'::'(.+)$/, {$0}), 'START', 't' ~ $*THREAD.id) if %*ENV<HIPH_THREAD_START>;
    my $proceed-with-analyze    = False;
    $lock.protect({
        if !$analyzed           { $proceed-with-analyze    = True; $analyzed      = True; }
    });
    self.init;
    self.analyze                if $proceed-with-analyze;
    self;
}

method init () {
    return self                                     if $!initialized;
    self.config.diag.post:                          self.^name ~ '::' ~ &?ROUTINE.name if %*ENV<HIPH_METHOD>;
    my $xml-content                                 = self.etl-branch(:TAG<content>,                                        :$!xml);
    my $xml-LogicalPartition                        = self.etl-branch(:TAG<LogicalPartition:LogicalPartition>,              :xml($xml-content));

    my $proceed-with-name-check = False;
    $lock.protect({
        if !$names-checked                          { $proceed-with-name-check = True; $names-checked = True; }
    });
    self.etl-node-name-check(:xml($xml-LogicalPartition)) if $proceed-with-name-check;

    $!id                                            = self.etl-text(:TAG<id>,                                               :$!xml);
    $!PartitionName                                 = self.etl-text(:TAG<PartitionName>,                                    :xml($xml-LogicalPartition));
    $!atom                                          = self.etl-atom(:xml(self.etl-branch(:TAG<Metadata>,                    :xml($xml-LogicalPartition))))              if self.attribute-is-accessed(self.^name, 'atom');
    $!published                                     = DateTime.new(self.etl-text(:TAG<published>,                           :$!xml))                                    if self.attribute-is-accessed(self.^name, 'published');
    $!AllowPerformanceDataCollection                = self.etl-text(:TAG<AllowPerformanceDataCollection>,                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'AllowPerformanceDataCollection');
    $!AssociatedPartitionProfile                    = self.etl-href(:xml(self.etl-branch(:TAG<AssociatedPartitionProfile>,  :xml($xml-LogicalPartition), :optional)))   if self.attribute-is-accessed(self.^name, 'AssociatedPartitionProfile');
    $!AvailabilityPriority                          = self.etl-text(:TAG<AvailabilityPriority>,                             :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'AvailabilityPriority');
    $!CurrentProcessorCompatibilityMode             = self.etl-text(:TAG<CurrentProcessorCompatibilityMode>,                :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'CurrentProcessorCompatibilityMode');
    $!CurrentProfileSync                            = self.etl-text(:TAG<CurrentProfileSync>,                               :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'CurrentProfileSync');
    $!IsBootable                                    = self.etl-text(:TAG<IsBootable>,                                       :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsBootable');
    $!IsConnectionMonitoringEnabled                 = self.etl-text(:TAG<IsConnectionMonitoringEnabled>,                    :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'IsConnectionMonitoringEnabled');
    $!IsOperationInProgress                         = self.etl-text(:TAG<IsOperationInProgress>,                            :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsOperationInProgress');
    $!IsRedundantErrorPathReportingEnabled          = self.etl-text(:TAG<IsRedundantErrorPathReportingEnabled>,             :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsRedundantErrorPathReportingEnabled');
    $!IsTimeReferencePartition                      = self.etl-text(:TAG<IsTimeReferencePartition>,                         :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsTimeReferencePartition');
    $!IsVirtualServiceAttentionLEDOn                = self.etl-text(:TAG<IsVirtualServiceAttentionLEDOn>,                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsVirtualServiceAttentionLEDOn');
    $!IsVirtualTrustedPlatformModuleEnabled         = self.etl-text(:TAG<IsVirtualTrustedPlatformModuleEnabled>,            :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsVirtualTrustedPlatformModuleEnabled');
    $!KeylockPosition                               = self.etl-text(:TAG<KeylockPosition>,                                  :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'KeylockPosition');
    $!LogicalSerialNumber                           = self.etl-text(:TAG<LogicalSerialNumber>,                              :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'LogicalSerialNumber');
    $!OperatingSystemVersion                        = self.etl-text(:TAG<OperatingSystemVersion>,                           :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'OperatingSystemVersion');
    if self.attribute-is-accessed(self.^name, 'PartitionCapabilities') {
        my $xml-PartitionCapabilities               = self.etl-branch(:TAG<PartitionCapabilities>,                          :xml($xml-LogicalPartition));
        $!PartitionCapabilities                     = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionCapabilities.new(:$!config, :xml($xml-PartitionCapabilities));
    }
    $!PartitionID                                   = self.etl-text(:TAG<PartitionID>,                                      :xml($xml-LogicalPartition));
    if self.attribute-is-accessed(self.^name, 'PartitionIOConfiguration') {
        my $xml-PartitionIOConfiguration            = self.etl-branch(:TAG<PartitionIOConfiguration>,                       :xml($xml-LogicalPartition));
        $!PartitionIOConfiguration                  = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionIOConfiguration.new(:$!config, :xml($xml-PartitionIOConfiguration));
    }
    if self.attribute-is-accessed(self.^name, 'PartitionMemoryConfiguration') {
        my $xml-PartitionMemoryConfiguration        = self.etl-branch(:TAG<PartitionMemoryConfiguration>,                   :xml($xml-LogicalPartition));
        $!PartitionMemoryConfiguration              = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionMemoryConfiguration.new(:$!config, :xml($xml-PartitionMemoryConfiguration));
    }
    if self.attribute-is-accessed(self.^name, 'PartitionProcessorConfiguration') {
        my $xml-PartitionProcessorConfiguration     = self.etl-branch(:TAG<PartitionProcessorConfiguration>,                :xml($xml-LogicalPartition));
        $!PartitionProcessorConfiguration           = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration.new(:$!config, :xml($xml-PartitionProcessorConfiguration));
    }
    if self.attribute-is-accessed(self.^name, 'PartitionProfiles') {
        my $xml-PartitionProfiles                   = self.etl-branch(:TAG<PartitionProfiles>,                              :xml($xml-LogicalPartition));
        @!PartitionProfiles                         = self.etl-links-URIs(                                                  :xml($xml-PartitionProfiles));
    }
    $!PartitionState                                = self.etl-text(:TAG<PartitionState>,                                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PartitionState');
    $!PartitionType                                 = self.etl-text(:TAG<PartitionType>,                                    :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PartitionType');
    $!PartitionUUID                                 = self.etl-text(:TAG<PartitionUUID>,                                    :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PartitionUUID');
    $!PendingProcessorCompatibilityMode             = self.etl-text(:TAG<PendingProcessorCompatibilityMode>,                :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PendingProcessorCompatibilityMode');
    $!ProcessorPool                                 = self.etl-href(:xml(self.etl-branch(:TAG<ProcessorPool>,               :xml($xml-LogicalPartition), :optional)))   if self.attribute-is-accessed(self.^name, 'ProcessorPool');
    $!ProgressPartitionDataRemaining                = self.etl-text(:TAG<ProgressPartitionDataRemaining>,                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'ProgressPartitionDataRemaining');
    $!ProgressPartitionDataTotal                    = self.etl-text(:TAG<ProgressPartitionDataTotal>,                       :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'ProgressPartitionDataTotal');
    $!ProgressState                                 = self.etl-text(:TAG<ProgressState>,                                    :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'ProgressState');
    $!ResourceMonitoringControlState                = self.etl-text(:TAG<ResourceMonitoringControlState>,                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'ResourceMonitoringControlState');
    $!ResourceMonitoringIPAddress                   = self.etl-text(:TAG<ResourceMonitoringIPAddress>,                      :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'ResourceMonitoringIPAddress');
    $!AssociatedManagedSystem                       = self.etl-href(:xml(self.etl-branch(:TAG<AssociatedManagedSystem>,     :xml($xml-LogicalPartition))))              if self.attribute-is-accessed(self.^name, 'AssociatedManagedSystem');
    if self.attribute-is-accessed(self.^name, 'HostEthernetAdapterLogicalPorts') {
        my $xml-HostEthernetAdapterLogicalPorts     = self.etl-branch(:TAG<HostEthernetAdapterLogicalPorts>,                :xml($xml-LogicalPartition));
        $!HostEthernetAdapterLogicalPorts           = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::HostEthernetAdapterLogicalPorts.new(:$!config, :xml($xml-HostEthernetAdapterLogicalPorts));
    }
    $!MACAddressPrefix                              = self.etl-text(:TAG<MACAddressPrefix>,                                 :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'MACAddressPrefix');
    $!IsServicePartition                            = self.etl-text(:TAG<IsServicePartition>,                               :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'IsServicePartition');
    $!PowerVMManagementCapable                      = self.etl-text(:TAG<PowerVMManagementCapable>,                         :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PowerVMManagementCapable');
    $!ReferenceCode                                 = self.etl-text(:TAG<ReferenceCode>,                                    :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'ReferenceCode');
    $!AssignAllResources                            = self.etl-text(:TAG<AssignAllResources>,                               :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'AssignAllResources');
    if self.attribute-is-accessed(self.^name, 'HardwareAcceleratorQoS') {
        my $xml-HardwareAcceleratorQoS              = self.etl-branch(:TAG<HardwareAcceleratorQoS>,                         :xml($xml-LogicalPartition));
        $!HardwareAcceleratorQoS                    = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::HardwareAcceleratorQoS.new(:$!config, :xml($xml-HardwareAcceleratorQoS));
    }
    $!LastActivatedProfile                          = self.etl-text(:TAG<LastActivatedProfile>,                             :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'LastActivatedProfile');
    $!HasPhysicalIO                                 = self.etl-text(:TAG<HasPhysicalIO>,                                    :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'HasPhysicalIO');
    $!OperatingSystemType                           = self.etl-text(:TAG<OperatingSystemType>,                              :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'OperatingSystemType');
    $!PendingSecureBoot                             = self.etl-text(:TAG<PendingSecureBoot>,                                :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PendingSecureBoot');
    $!CurrentSecureBoot                             = self.etl-text(:TAG<CurrentSecureBoot>,                                :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'CurrentSecureBoot');
    $!BootMode                                      = self.etl-text(:TAG<BootMode>,                                         :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'BootMode');
    $!PowerOnWithHypervisor                         = self.etl-text(:TAG<PowerOnWithHypervisor>,                            :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'PowerOnWithHypervisor');
    $!Description                                   = self.etl-text(:TAG<Description>,                                      :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'Description');
    $!MigrationStorageViosDataStatus                = self.etl-text(:TAG<MigrationStorageViosDataStatus>,                   :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'MigrationStorageViosDataStatus');
    $!MigrationStorageViosDataTimestamp             = self.etl-text(:TAG<MigrationStorageViosDataTimestamp>,                :xml($xml-LogicalPartition), :optional)     if self.attribute-is-accessed(self.^name, 'MigrationStorageViosDataTimestamp');
    $!RemoteRestartCapable                          = self.etl-text(:TAG<RemoteRestartCapable>,                             :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'RemoteRestartCapable');
    $!SimplifiedRemoteRestartCapable                = self.etl-text(:TAG<SimplifiedRemoteRestartCapable>,                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'SimplifiedRemoteRestartCapable');
    $!HasDedicatedProcessorsForMigration            = self.etl-text(:TAG<HasDedicatedProcessorsForMigration>,               :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'HasDedicatedProcessorsForMigration');
    $!SuspendCapable                                = self.etl-text(:TAG<SuspendCapable>,                                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'SuspendCapable');
    $!MigrationDisable                              = self.etl-text(:TAG<MigrationDisable>,                                 :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'MigrationDisable');
    $!MigrationState                                = self.etl-text(:TAG<MigrationState>,                                   :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'MigrationState');
    $!RemoteRestartState                            = self.etl-text(:TAG<RemoteRestartState>,                               :xml($xml-LogicalPartition))                if self.attribute-is-accessed(self.^name, 'RemoteRestartState');
    if self.attribute-is-accessed(self.^name, 'VirtualFibreChannelClientAdapters') {
        my $xml-VirtualFibreChannelClientAdapters   = self.etl-branch(:TAG<VirtualFibreChannelClientAdapters>,              :xml($xml-LogicalPartition), :optional);
        @!VirtualFibreChannelClientAdapters         = self.etl-links-URIs(                                                  :xml($xml-VirtualFibreChannelClientAdapters)) with $xml-VirtualFibreChannelClientAdapters;
    }
    if self.attribute-is-accessed(self.^name, 'DedicatedVirtualNICs') {
        my $xml-DedicatedVirtualNICs                = self.etl-branch(:TAG<DedicatedVirtualNICs>,                           :xml($xml-LogicalPartition), :optional);
        @!DedicatedVirtualNICs                      = self.etl-links-URIs(                                                  :xml($xml-DedicatedVirtualNICs)) with $xml-DedicatedVirtualNICs;
    }
    if self.attribute-is-accessed(self.^name, 'BootListInformation') {
        my $xml-BootListInformation                 = self.etl-branch(:TAG<BootListInformation>,                            :xml($xml-LogicalPartition));
        $!BootListInformation                       = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::BootListInformation.new(:$!config, :xml($xml-BootListInformation));
    }
    $!xml                                           = Nil;
    $!initialized                                   = True;
    self;
}

=finish
