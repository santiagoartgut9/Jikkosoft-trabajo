const http = require('http');

const tests = [
  {
    name: 'Root endpoint',
    url: 'http://localhost:3000/',
    expectedStatus: 200
  },
  {
    name: 'Health endpoint',
    url: 'http://localhost:3000/health',
    expectedStatus: 200
  }
];

async function runTests() {
  console.log('Running application tests...\n');
  
  let allPassed = true;
  
  for (const test of tests) {
    try {
      const response = await httpRequest(test.url);
      const passed = response.statusCode === test.expectedStatus;
      
      console.log(`${passed ? '' : ''} ${test.name}`);
      console.log(`   Expected: ${test.expectedStatus}, Got: ${response.statusCode}`);
      
      if (!passed) {
        allPassed = false;
      }
    } catch (error) {
      console.log(` ${test.name}`);
      console.log(`   Error: ${error.message}`);
      allPassed = false;
    }
  }
  
  console.log(`\n${allPassed ? ' All tests passed!' : ' Some tests failed!'}`);
  process.exit(allPassed ? 0 : 1);
}

function httpRequest(url) {
  return new Promise((resolve, reject) => {
    const req = http.get(url, (res) => {
      resolve(res);
    });
    
    req.on('error', (err) => {
      reject(err);
    });
    
    req.setTimeout(5000, () => {
      req.destroy();
      reject(new Error('Request timeout'));
    });
  });
}

runTests();