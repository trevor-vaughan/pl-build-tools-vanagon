# Contains all common project settings in one place

platform = proj.get_platform

# For solaris, we build cross-compilers
if platform.is_solaris?
  if platform.architecture == 'i386'
    platform_triple = "#{platform.architecture}-pc-solaris2.#{platform.os_version}"
  else
    platform_triple = "#{platform.architecture}-sun-solaris2.#{platform.os_version}"
  end
end

# Project level settings our components will care about
proj.setting(:platform_triple, platform_triple)
proj.setting(:basedir, "/opt/pl-build-tools")
proj.setting(:prefix, "/opt/pl-build-tools/#{platform_triple}")
proj.setting(:sysconfdir, "/etc/pl-build-tools")
proj.setting(:logdir, "/var/log/pl-build-tools")
proj.setting(:piddir, "/var/run/pl-build-tools")
proj.setting(:bindir, File.join(proj.prefix, "bin"))
proj.setting(:libdir, File.join(proj.prefix, "lib"))
proj.setting(:includedir, File.join(proj.prefix, "include"))
proj.setting(:datadir, File.join(proj.prefix, "share"))
proj.setting(:mandir, File.join(proj.datadir, "man"))

proj.directory proj.basedir