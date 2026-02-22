# firebat-panel-client

D-Bus client library for communicating with the Firebat Panel daemon.

## Usage

```rust
use firebat_panel_client::DaemonClient;

#[tokio::main]
async fn main() {
    let client = DaemonClient::connect().await.unwrap();
    let orientation = client.get_orientation().await.unwrap();
    println!("Current orientation: {}", orientation);
}
```

Connects to `org.firebat.Panel1` on the system bus by default.

See the [main project README](../../README.md) for full documentation.
