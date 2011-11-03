module Puppet::Parser::Functions

    newfunction( :make_https, :type => :rvalue ) do |args|

        # special situation, see http://projects.puppetlabs.com/issues/4915
        #  When this function is called from a manifest, args will be an array.
        #  When this function is called from a template, args will be a single string.
        #  Thus, let us make sure args is always an array.
        args = [args].flatten

        if (args.size != 1)
            raise( Puppet::ParseError, "make_https: wrong number of arguments "+
                "given #{args.size} for 1")
        end
        
        str = args[0].clone
        
        if str =~ /^(\S+:\/\/)/
          str.gsub( /^\S+:\/\//, 'https://\1' )
        else
          'https://' + str
        end
    end
end
