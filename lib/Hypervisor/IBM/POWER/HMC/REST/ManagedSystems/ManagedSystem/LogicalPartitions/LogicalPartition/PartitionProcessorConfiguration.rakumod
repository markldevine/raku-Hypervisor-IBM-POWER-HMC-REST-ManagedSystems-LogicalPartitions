need    Hypervisor::IBM::POWER::HMC::REST::Config;
need    Hypervisor::IBM::POWER::HMC::REST::Config::Analyze;
need    Hypervisor::IBM::POWER::HMC::REST::Config::Dump;
need    Hypervisor::IBM::POWER::HMC::REST::Config::Optimize;
use     Hypervisor::IBM::POWER::HMC::REST::Config::Traits;
need    Hypervisor::IBM::POWER::HMC::REST::ETL::XML;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::DedicatedProcessorConfiguration;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::SharedProcessorConfiguration;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::CurrentDedicatedProcessorConfiguration;
need    Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::CurrentSharedProcessorConfiguration;
unit    class Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration:api<1>:auth<Mark Devine (mark@markdevine.com)>
            does Hypervisor::IBM::POWER::HMC::REST::Config::Analyze
            does Hypervisor::IBM::POWER::HMC::REST::Config::Dump
            does Hypervisor::IBM::POWER::HMC::REST::Config::Optimize
            does Hypervisor::IBM::POWER::HMC::REST::ETL::XML;

my      Bool                                                                                                                                                                            $names-checked  = False;
my      Bool                                                                                                                                                                            $analyzed       = False;
my      Lock                                                                                                                                                                            $lock           = Lock.new;
has     Hypervisor::IBM::POWER::HMC::REST::Config                                                                                                                                       $.config        is required;
has     Bool                                                                                                                                                                            $.initialized   = False;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::DedicatedProcessorConfiguration         $.DedicatedProcessorConfiguration           is conditional-initialization-attribute;
has     Str                                                                                                                                                                             $.HasDedicatedProcessors                    is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::SharedProcessorConfiguration            $.SharedProcessorConfiguration              is conditional-initialization-attribute;
has     Str                                                                                                                                                                             $.SharingMode                               is conditional-initialization-attribute;
has     Str                                                                                                                                                                             $.CurrentHasDedicatedProcessors             is conditional-initialization-attribute;
has     Str                                                                                                                                                                             $.CurrentSharingMode                        is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::CurrentDedicatedProcessorConfiguration  $.CurrentDedicatedProcessorConfiguration    is conditional-initialization-attribute;
has     Str                                                                                                                                                                             $.RuntimeHasDedicatedProcessors             is conditional-initialization-attribute;
has     Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::CurrentSharedProcessorConfiguration     $.CurrentSharedProcessorConfiguration       is conditional-initialization-attribute;

method  xml-name-exceptions () { return set <Metadata>; }

submethod TWEAK {
    self.config.diag.post:      self.^name ~ '::' ~ &?ROUTINE.name if %*ENV<HIPH_SUBMETHOD>;
    my $proceed-with-name-check = False;
    my $proceed-with-analyze    = False;
    $lock.protect({
        if !$analyzed           { $proceed-with-analyze    = True; $analyzed      = True; }
        if !$names-checked      { $proceed-with-name-check = True; $names-checked = True; }
    });
    self.etl-node-name-check    if $proceed-with-name-check;
    self.init;
    self.analyze                if $proceed-with-analyze;
    self;
}

method init () {
    return self                                 if $!initialized;
    self.config.diag.post:                      self.^name ~ '::' ~ &?ROUTINE.name if %*ENV<HIPH_METHOD>;
    if self.attribute-is-accessed(self.^name, 'DedicatedProcessorConfiguration') {
        $!DedicatedProcessorConfiguration           = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::DedicatedProcessorConfiguration.new(:$!config, :xml(self.etl-branch(:TAG<DedicatedProcessorConfiguration>, :$!xml, :optional)));
    }
    $!HasDedicatedProcessors                    = self.etl-text(:TAG<HasDedicatedProcessors>,           :$!xml) if self.attribute-is-accessed(self.^name, 'HasDedicatedProcessors');
    if self.attribute-is-accessed(self.^name, 'SharedProcessorConfiguration') {
        $!SharedProcessorConfiguration              = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::SharedProcessorConfiguration.new(:$!config, :xml(self.etl-branch(:TAG<SharedProcessorConfiguration>, :$!xml, :optional)));
    }
    $!SharingMode                               = self.etl-text(:TAG<SharingMode>,                      :$!xml) if self.attribute-is-accessed(self.^name, 'SharingMode');
    $!CurrentHasDedicatedProcessors             = self.etl-text(:TAG<CurrentHasDedicatedProcessors>,    :$!xml) if self.attribute-is-accessed(self.^name, 'CurrentHasDedicatedProcessors');
    $!CurrentSharingMode                        = self.etl-text(:TAG<CurrentSharingMode>,               :$!xml) if self.attribute-is-accessed(self.^name, 'CurrentSharingMode');
    if self.attribute-is-accessed(self.^name, 'CurrentDedicatedProcessorConfiguration') {
        $!CurrentDedicatedProcessorConfiguration    = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::CurrentDedicatedProcessorConfiguration.new(:$!config, :xml(self.etl-branch(:TAG<CurrentDedicatedProcessorConfiguration>, :$!xml, :optional)));
    }
    $!RuntimeHasDedicatedProcessors             = self.etl-text(:TAG<RuntimeHasDedicatedProcessors>,    :$!xml) if self.attribute-is-accessed(self.^name, 'RuntimeHasDedicatedProcessors');
    if self.attribute-is-accessed(self.^name, 'CurrentSharedProcessorConfiguration') {
        $!CurrentSharedProcessorConfiguration       = Hypervisor::IBM::POWER::HMC::REST::ManagedSystems::ManagedSystem::LogicalPartitions::LogicalPartition::PartitionProcessorConfiguration::CurrentSharedProcessorConfiguration.new(:$!config, :xml(self.etl-branch(:TAG<CurrentSharedProcessorConfiguration>, :$!xml, :optional)));
    }
    $!xml                                       = Nil;
    $!initialized                               = True;
    self;
}

=finish
