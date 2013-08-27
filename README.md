# NAME

Mojolicious::Plugin::GoogleAnalytics - Mojolicious Plugin

# SYNOPSIS

    # Mojolicious
    $self->plugin('GoogleAnalytics');

    # Mojolicious::Lite
    plugin 'GoogleAnalytics';

    # In your layout template
    <%= analytics_inc 'UA-32432-1' %>
    </head> <!-- Make sure its just before closing head tag -->



# DESCRIPTION

[Mojolicious::Plugin::GoogleAnalytics](http://search.cpan.org/perldoc?Mojolicious::Plugin::GoogleAnalytics) is a [Mojolicious](http://search.cpan.org/perldoc?Mojolicious) plugin. Inserts Google Analytics code and associates your analytics id.

# METHODS

[Mojolicious::Plugin::GoogleAnalytics](http://search.cpan.org/perldoc?Mojolicious::Plugin::GoogleAnalytics) inherits all methods from
[Mojolicious::Plugin](http://search.cpan.org/perldoc?Mojolicious::Plugin) and implements the following new ones.

## register

    $plugin->register(Mojolicious->new);

Register plugin in [Mojolicious](http://search.cpan.org/perldoc?Mojolicious) application.

# AUTHOR

Adam Stokes <adamjs@cpan.org>

# COPYRIGHT

Copyright 2013- Adam Stokes

# LICENSE

Licensed under the same terms as Perl.

# SEE ALSO

[Mojolicious](http://search.cpan.org/perldoc?Mojolicious), [Mojolicious::Guides](http://search.cpan.org/perldoc?Mojolicious::Guides), [http://mojolicio.us](http://mojolicio.us).
