const { exec } = require('child_process');

// Ganti 'namafile.sh' dengan nama file .sh yang ingin kamu jalankan
const command = 'docker build -t kali && docker run kali';

exec(command, (error, stdout, stderr) => {
  if (error) {
    console.error(`Terjadi kesalahan: ${error}`);
    return;
  }
  console.log(`Keluaran stdout: ${stdout}`);
  console.error(`Keluaran stderr: ${stderr}`);
});

