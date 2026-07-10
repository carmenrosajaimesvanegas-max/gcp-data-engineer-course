import argparse
from google.cloud import compute_v1

def create_snapshot(project_id, disk_name, snapshot_name, zone):
    disk_client = compute_v1.DisksClient()
    disk = f"projects/{project_id}/zones/{zone}/disks/{disk_name}"
    snapshot = compute_v1.Snapshot(name=snapshot_name, source_disk=disk)
    
    snap_client = compute_v1.SnapshotsClient()
    op = snap_client.insert(project=project_id, snapshot_resource=snapshot)
    op.result() # Esperar a que termine
    print("Snapshot creado.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Crear snapshot de un disco.")
    parser.add_argument("--project-id", required=True, help="ID del proyecto.")
    parser.add_argument("--disk-name", required=True, help="Nombre del disco.")
    parser.add_argument("--snapshot-name", required=True, help="Nombre del snapshot.")
    parser.add_argument("--zone", required=True, help="Zona del disco.")
    args = parser.parse_args()
    create_snapshot(args.project_id, args.disk_name, args.snapshot_name, args.zone)
    