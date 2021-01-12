import os
import tempfile
import subprocess
import shutil

import infra.basetest


class TestDotnetSdkBase(infra.basetest.BRTest):

    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
        """
        BR2_TARGET_ROOTFS_CPIO=y
        """

class TestHostDotnetSdk(TestDotnetSdkBase):
    config = TestDotnetSdkBase.config + \
        """
        BR2_PACKAGE_HOST_DOTNET_SDK=y
        """

    def test_run(self):
        env = os.environ.copy()
        hostdir = os.path.join(self.builddir, 'host')
        dotnet = os.path.join(hostdir, 'usr', 'bin', 'dotnet')
        cmd = [dotnet, '--version']
        exit_code = subprocess.call(cmd, stdout=self.b.logfile, stderr=self.b.logfile, env=env)
        self.assertEqual(exit_code, 0)
