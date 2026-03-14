<?php

namespace App\GraphQL\Resolvers;

use App\Database;
use App\Models\AttributeFactory;

class AttributeResolver
{
    public static function forProduct(string $productId): array
    {
        $pdo = Database::connect();

        $stmt = $pdo->prepare(
            "SELECT id, attribute_id, name, type FROM attributes WHERE product_id = ? ORDER BY id"
        );
        $stmt->execute([$productId]);
        $attributeRows = $stmt->fetchAll(\PDO::FETCH_ASSOC);

        $attributes = [];
        foreach ($attributeRows as $row) {
            $itemStmt = $pdo->prepare(
                "SELECT item_id, display_value, value FROM attribute_items WHERE attribute_id = ? ORDER BY id"
            );
            $itemStmt->execute([$row['id']]);
            $itemRows = $itemStmt->fetchAll(\PDO::FETCH_ASSOC);

            $items = array_map(fn($item) => [
                'id' => $item['item_id'],
                'displayValue' => $item['display_value'],
                'value' => $item['value'],
            ], $itemRows);

            $attribute = AttributeFactory::create([
                'id' => $row['attribute_id'],
                'name' => $row['name'],
                'type' => $row['type'],
                'items' => $items,
            ]);

            $attributes[] = $attribute->toArray();
        }

        return $attributes;
    }
}
