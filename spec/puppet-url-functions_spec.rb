require File.join(File.dirname(__FILE__), 'spec_helper')

describe "with_trailing_slash", :type => :puppet_function do
  it { should run.with_params('http://web.dom.tld/path').and_return('http://web.dom.tld/path/') }
  it { should run.with_params('http://web.dom.tld/path/').and_return('http://web.dom.tld/path/') }
end

describe "without_trailing_slash", :type => :puppet_function do
  it { should run.with_params('http://web.dom.tld/path').and_return('http://web.dom.tld/path') }
  it { should run.with_params('http://web.dom.tld/path/').and_return('http://web.dom.tld/path') }
end