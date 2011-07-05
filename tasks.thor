class Ec2 < Thor

  desc "ssh", "ssh to instance"
  def ssh

    
    results = %x("ec2-describe-instances")
    
    servers = []
    results.split("\n").each do |line|
      next if line  =~ /^RESER/
      
      servers << line.split[3]
      say "#{servers.size}. #{servers.last}"
    end


    s = nil
    if servers.empty?
      say "no instances found"
      exit
    elsif servers.size == 1
      s = servers[0]
    else
      i = ask("which server?").to_i
      s = servers[i-1]
    end

    system("ssh rndeployer@#{s}")
    
  end
end
