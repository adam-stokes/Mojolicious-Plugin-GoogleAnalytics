package Mojolicious::Plugin::GoogleAnalytics;
# ABSTRACT: GoogleAnalytics plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('GoogleAnalytics');

  # Mojolicious::Lite
  plugin 'GoogleAnalytics';

  # In your layout template
  <%= analytics_inc 'UA-32432-1', 'example.com', 1 %>
  </head> <!-- Make sure its just before closing head tag -->

=head1 DESCRIPTION

L<Mojolicious::Plugin::GoogleAnalytics> is a L<Mojolicious>
plugin. Inserts Google Analytics code and associates your analytics
id.

=head1 OPTIONS

=head2 Track Subdomains

Put the domain which qualifies any subdomains you wish to track,
eg. blog.example.com, apps.example.com will have the second arguement
set to 'example.com'

=head2 Multiple top level domains

Default is set to 1 to allow domains such as example.fr, example.cn,
and example.com

=cut

use Mojo::Base 'Mojolicious::Plugin';

has 'template' => 'analytics_template';

=method register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=cut
sub register {
    my ($plugin, $app) = (shift, shift);
    push @{$app->renderer->classes}, __PACKAGE__;

    $app->helper(analytics => sub {$plugin});

    $app->helper(
        analytics_inc => sub {
            my $self                  = shift;
            my $analytics_id          = shift;
            my $domain_sub            = shift;
            my $allow_multi_top_level = shift;

            die "No analytics ID defined" unless defined $analytics_id;
            $self->render(
                template              => $self->analytics->template,
                partial               => 1,
                analytics_id          => $analytics_id,
                domain_sub            => $domain_sub,
                allow_multi_top_level => $allow_multi_top_level || undef,
            );
        }
    );
}

1;

__DATA__

@@ analytics_template.html.ep

%= javascript begin
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '<%= $analytics_id %>']);
  % if ($domain_sub) {
  _gaq.push(['_setDomainName', '<%= $domain_sub %>']);
  % }
  % if ($allow_multi_top_level) {
  _gaq.push(['_setAllowLinker', true]);
  % }
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
%= end

