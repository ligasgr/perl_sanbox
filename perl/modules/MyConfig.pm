package MyConfig;

sub new {
        my ($class_name) = @_;
        my ($self) = {};
        bless ($self, $class_name);
        return $self;
    }

sub read {
      my ($self, $file) = @_;
      my ($line, $section);

      open (CONFIGFILE, $file) or return 0;
      while ($line = <CONFIGFILE>) {
         if ($line =~ /^\[(.*)\]/) {
            $section = $1;
         } elsif ($line =~ /^([^=]+)=(.*)/) {
            my ($config_name, $config_val) = ($1, $2);
            if ($section) {
               $self->{"$section.$config_name"} = $config_val;
            } else {
               $self->{$config_name} = $config_val;
            }
         }
      }

      close CONFIGFILE;
      return 1;
   }

sub get {
        my ($self, $key) = @_;
        return $self->{$key};
    }

sub set {
        my ($self, $key, $value) = @_;
        $self->{$key} = $value;
    }

sub write {
	my ($self, $filename) = @_;
	my $last_section = '';
	open(WRITTEN_FILE, ">", $filename) or warn "Error opening file: $!\n";
	for $key (sort keys %$self) {
		my @tmp = split /\./, $key;
		unless ($last_section eq $tmp[0]) {
			print WRITTEN_FILE "[", $tmp[0], "]\n";
			$last_section = $tmp[0];
		}
		print WRITTEN_FILE $tmp[1], "=", $self->{$key}, "\n";
	}
	
}

warn "Config loaded!\n";
1;
